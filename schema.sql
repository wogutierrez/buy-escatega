-- 1. Table for Users
CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  whatsapp_number TEXT NOT NULL,
  role TEXT DEFAULT 'user', -- 'user' or 'admin'
  is_approved INTEGER DEFAULT 0, -- 0 = Pending, 1 = Approved
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Table for Listings
CREATE TABLE IF NOT EXISTS listings (
  id TEXT PRIMARY KEY,
  seller_id TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  price_cents INTEGER NOT NULL,
  category TEXT NOT NULL, -- 'House', 'Electronics', or 'Clothes'
  photo_url TEXT NOT NULL,
  status TEXT DEFAULT 'active', -- 'active' or 'sold'
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (seller_id) REFERENCES users(id)
);
