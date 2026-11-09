-- ==============================================================
-- SISTEM INFORMASI MANAJEMEN DONAT BU DIANA
-- File Skema & Data Database Relasional (MySQL / MariaDB / phpMyAdmin)
-- Dibuat untuk: Tugas Kuliah / Pengelolaan Usaha Donat Bu Diana
-- ==============================================================

SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS donat_bu_diana;
CREATE DATABASE donat_bu_diana CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE donat_bu_diana;

-- --------------------------------------------------------------
-- 1. TABEL: users (Pengguna & Hak Akses Role)
-- --------------------------------------------------------------
CREATE TABLE users (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('pemilik', 'kasir', 'pelanggan') NOT NULL DEFAULT 'pelanggan',
  role_name VARCHAR(50) NOT NULL,
  avatar TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO users (id, name, email, password, role, role_name, avatar) VALUES
('USR-001', 'Diana herawati', 'diana Herwati@donatbudiana.com', 'admin123', 'pemilik', 'Pemilik Usaha', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=200&q=80'),
('USR-002', 'Zahwa Qolbia', 'zahwa qolbia@donatbudiana.com', 'kasir123', 'kasir', 'Kasir & Barista', 'https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&w=200&q=80'),
('USR-003', 'Pelanggan Setia', 'pelanggan@gmail.com', 'user123', 'pelanggan', 'Pelanggan Umum', 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&q=80');

-- --------------------------------------------------------------
-- 2. TABEL: categories (Kategori Produk Donat)
-- --------------------------------------------------------------
CREATE TABLE categories (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  slug VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO categories (id, name, slug, description) VALUES
('cat-1', 'Donat Klasik', 'klasik', 'Donat empuk bertabur gula salju dan meses tradisional khas tempo dulu'),
('cat-2', 'Glaze Premium', 'glaze', 'Donat dengan lelehan glaze aneka rasa import kekinian'),
('cat-3', 'Bomboloni Lumer', 'bomboloni', 'Donat isi filling melimpah yang meledak di gigitan pertama'),
('cat-4', 'Paket Hemat & Box', 'paket', 'Pilihan paket box 6 pcs dan 12 pcs untuk dinikmati bersama keluarga'),
('cat-5', 'Minuman Segar', 'minuman', 'Minuman pendamping lezat menemani makan donat santai');

-- --------------------------------------------------------------
-- 3. TABEL: products (Master Data Produk Donat & Minuman)
-- --------------------------------------------------------------
CREATE TABLE products (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  category_id VARCHAR(50) NOT NULL,
  price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  cost_price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  stock INT NOT NULL DEFAULT 0,
  image TEXT,
  description TEXT,
  is_available BOOLEAN DEFAULT TRUE,
  sales_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES categories(id) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

INSERT INTO products (id, name, category_id, price, cost_price, stock, image, description, is_available, sales_count) VALUES
('PROD-001', 'Donat Gula Halus Salju', 'cat-1', 6000.00, 3000.00, 45, 'https://images.unsplash.com/photo-1551024709-8f23befc6f87?auto=format&fit=crop&w=600&q=80', 'Donat kentang super empuk dengan taburan gula halus salju premium yang tidak mudah meleleh.', TRUE, 128),
('PROD-002', 'Donat Meses Cokelat Klasik', 'cat-1', 7000.00, 3500.00, 38, 'https://images.unsplash.com/photo-1527515637462-cff94eecc1ac?auto=format&fit=crop&w=600&q=80', 'Kombinasi krim mentega gurih dan taburan meses cokelat berkualitas melimpah ruah.', TRUE, 142),
('PROD-003', 'Donat Glaze Strawberry Sparkle', 'cat-2', 9000.00, 4500.00, 25, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=80', 'Glaze strawberry segar manis dengan taburan sprinkle warna-warni yang renyah.', TRUE, 96),
('PROD-004', 'Donat Matcha Green Tea Almond', 'cat-2', 10000.00, 5000.00, 20, 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=600&q=80', 'Glaze matcha Uji autentik bertabur irisan almond panggang harum dan renyah.', TRUE, 84),
('PROD-005', 'Donat Choco Crispy Melt', 'cat-2', 9500.00, 4800.00, 30, 'https://images.unsplash.com/photo-1582293041079-7814c2f12063?auto=format&fit=crop&w=600&q=80', 'Glaze cokelat belgian pekat dilapisi choco balls renyah krispi.', TRUE, 115),
('PROD-006', 'Bomboloni Belgian Choco Lava', 'cat-3', 11000.00, 5500.00, 22, 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?auto=format&fit=crop&w=600&q=80', 'Donat tanpa lubang isi cokelat lumer tebal yang meleleh nikmat di mulut.', TRUE, 160),
('PROD-007', 'Bomboloni Vanilla Custard', 'cat-3', 10500.00, 5200.00, 18, 'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=600&q=80', 'Custard krim vanilla susu lembut beraroma butterscotch manis pas.', TRUE, 89),
('PROD-008', 'Paket Box Lusinan (Isi 12 Campur)', 'cat-4', 95000.00, 48000.00, 15, 'https://images.unsplash.com/photo-1579372786545-d24232daf58c?auto=format&fit=crop&w=600&q=80', 'Box exclusive isi 12 varian donat favorit Bu Diana. Hemat Rp 20.000!', TRUE, 42),
('PROD-009', 'Paket Box Setengah Lusin (Isi 6)', 'cat-4', 50000.00, 26000.00, 25, 'https://images.unsplash.com/photo-1626094309830-abbb0c97da56?auto=format&fit=crop&w=600&q=80', 'Paket 6 donat pilihan terbaik (2 klasik, 2 glaze, 2 bomboloni).', TRUE, 67),
('PROD-010', 'Es Kopi Susu Donat Bu Diana', 'cat-5', 15000.00, 7000.00, 50, 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?auto=format&fit=crop&w=600&q=80', 'Kopi robusta blend gula aren murni dan susu creamy, jodoh terbaik donat kentang.', TRUE, 110);

-- --------------------------------------------------------------
-- 4. TABEL: orders (Transaksi Penjualan & POS)
-- --------------------------------------------------------------
CREATE TABLE orders (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  customer_phone VARCHAR(20) DEFAULT '-',
  total_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  paid_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  change_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  payment_method ENUM('Tunai', 'QRIS', 'Transfer BCA') NOT NULL DEFAULT 'Tunai',
  payment_status ENUM('Lunas', 'Belum Bayar', 'Dibatalkan') NOT NULL DEFAULT 'Lunas',
  order_status ENUM('Pesanan Masuk', 'Sedang Dibuat', 'Siap Diambil', 'Selesai', 'Dibatalkan') NOT NULL DEFAULT 'Sedang Dibuat',
  cashier_name VARCHAR(100) DEFAULT 'Kasir Toko',
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO orders (id, customer_name, customer_phone, total_amount, paid_amount, change_amount, payment_method, payment_status, order_status, cashier_name, notes, created_at) VALUES
('ORD-20261109-001', 'Rani Paramitha', '081234567890', 125000.00, 150000.00, 25000.00, 'Tunai', 'Lunas', 'Selesai', 'Siti (Kasir)', 'Minta dipacking rapi untuk oleh-oleh', '2026-11-09 09:15:00'),
('ORD-20261109-002', 'Anton Wijaya', '085678901234', 53000.00, 53000.00, 0.00, 'QRIS', 'Lunas', 'Sedang Dibuat', 'Budi (Kasir)', 'Donat matcha minta almond lebih banyak', '2026-11-09 11:40:00'),
('ORD-20261109-003', 'Dewi Sartika', '087712345678', 100000.00, 100000.00, 0.00, 'Transfer BCA', 'Lunas', 'Siap Diambil', 'Siti (Kasir)', 'Ambil jam 14.00', '2026-11-09 12:10:00'),
('ORD-20261109-004', 'Kurniawan', '081987654321', 65000.00, 0.00, 0.00, 'Tunai', 'Belum Bayar', 'Pesanan Masuk', 'Budi (Kasir)', 'Bayar pas ambil', '2026-11-09 14:30:00');

-- --------------------------------------------------------------
-- 5. TABEL: order_items (Detail Item Rincian Per Transaksi)
-- --------------------------------------------------------------
CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id VARCHAR(50) NOT NULL,
  product_id VARCHAR(50) NOT NULL,
  product_name VARCHAR(150) NOT NULL,
  price DECIMAL(12,2) NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  subtotal DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES orders(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

INSERT INTO order_items (order_id, product_id, product_name, price, quantity, subtotal) VALUES
('ORD-20261109-001', 'PROD-008', 'Paket Box Lusinan (Isi 12 Campur)', 95000.00, 1, 95000.00),
('ORD-20261109-001', 'PROD-010', 'Es Kopi Susu Donat Bu Diana', 15000.00, 2, 30000.00),
('ORD-20261109-002', 'PROD-006', 'Bomboloni Belgian Choco Lava', 11000.00, 3, 33000.00),
('ORD-20261109-002', 'PROD-004', 'Donat Matcha Green Tea Almond', 10000.00, 2, 20000.00),
('ORD-20261109-003', 'PROD-009', 'Paket Box Setengah Lusin (Isi 6)', 50000.00, 2, 100000.00),
('ORD-20261109-004', 'PROD-001', 'Donat Gula Halus Salju', 6000.00, 5, 30000.00),
('ORD-20261109-004', 'PROD-002', 'Donat Meses Cokelat Klasik', 7000.00, 5, 35000.00);

-- --------------------------------------------------------------
-- 6. INDEXING (Optimasi Kecepatan Query)
-- --------------------------------------------------------------
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_orders_status ON orders(order_status);
CREATE INDEX idx_orders_payment ON orders(payment_status);
CREATE INDEX idx_orders_created ON orders(created_at);
CREATE INDEX idx_order_items_order ON order_items(order_id);

-- --------------------------------------------------------------
-- 7. VIEW KHUSUS LAPORAN & DASHBOARD PEMILIK
-- --------------------------------------------------------------
-- View: Rekap Total Omzet & Penjualan Donat Terlaris
CREATE OR REPLACE VIEW v_rekap_produk_terlaris AS
SELECT 
  p.id AS product_id,
  p.name AS product_name,
  c.name AS category_name,
  p.price,
  p.cost_price,
  (p.price - p.cost_price) AS profit_per_item,
  COALESCE(SUM(oi.quantity), 0) AS total_terjual,
  COALESCE(SUM(oi.subtotal), 0) AS total_pendapatan
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.name, c.name, p.price, p.cost_price
ORDER BY total_terjual DESC;

SET FOREIGN_KEY_CHECKS = 1;
