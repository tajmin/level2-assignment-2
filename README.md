# 1. What is PostgreSQL?

`PostgreSQL` হচ্ছে একটি ওপেন-সোর্স রিলেশনাল ডেটাবেজ ম্যানেজমেন্ট সিস্টেম (RDBMS) যা মূলতঃ SQL (Structured Query Language) কে ব্যবহার ও এক্সটেন্ড করে এবং এর সাথে ডেটা সংরক্ষণ, পরিবর্তন, আনুপাতিক বৃদ্ধি, মুছে ফেলা সহ ডেটা ব্যবস্থাপনার জন্য অত্যন্ত নির্ভরযোগ্য ও শক্তিশালী একটা প্ল্যাটফর্ম প্রদান করে। এটি মাল্টি-প্লাটফর্ম সাপোর্টেড অর্থাৎ উইন্ডোজ, লিনাক্স এবং ম্যাক অপারেটিং সিস্টেমে ব্যবহার করা যায়। PostgreSQL অনেক ধরনের ফিচার নিয়ে আসে, যা ডেভেলপারদের অ্যাপ্লিকেশন বানাতে সাহায্য করে, ডেটাবেজ অ্যাডমিনদের data integrity রক্ষা করতে ও fault-tolerant environment তৈরি করতে সহায়তা করে, এবং যেকোনো সাইজের dataset হোক না কেন, তা সহজে ম্যানেজ করতে সাহায্য করে।

<br/>

### PostgreSQL এর বৈশিষ্ট্য

- <b>Open Source:</b>সোর্স কোড উন্মুক্ত। বিনামূল্যে ব্যবহার, পরিবর্তন এবং বিতরণ করা যায়
- <b>ACID Compliance: </b> Atomicity, Consistency, Isolation, Durability - এই চারটি বৈশিষ্ট্য PostgreSQL এ পাওয়া যায়
- <b>JSON & NoSQL Support:</b> JSON/JSONB ডাটা টাইপ সাপোর্ট করে
- <b>All Purpose Databse:</b> ওয়েব অ্যাপ, ডেটা ওয়্যারহাউস, জিআইএস অ্যাপ (PostGIS দিয়ে), আইওটি, বৈজ্ঞানিক গবেষণা—সব জায়গায় ব্যবহার করা যায়।

<br/>

### PostgreSQL বনাম অন্যান্য ডেটাবেজ

| বৈশিষ্ট্য         | PostgreSQL        | MySQL                                   | SQLite   | MongoDB                       |
| ----------------- | ----------------- | --------------------------------------- | -------- | ----------------------------- |
| **Type**          | RDBMS             | RDBMS                                   | Embedded | NoSQL                         |
| **ACID**          | সম্পূর্ণ          | আংশিক (ডেটাবেজ ইঞ্জিনের উপর নির্ভর করে) | সম্পূর্ণ | No (transactions সাপোর্ট করে) |
| **JSON Support**  | Excellent (JSONB) | সীমিত                                   | বেসিক    | নেটিভ                         |
| **Extensibility** | খুব উচ্চ          | মধ্যম                                   | নিম্ন    | মধ্যম                         |

<br/>

### SQL Query উদাহরণ

ধরা যাক, user নামের একটি টেবিল তৈরি করতে চাই। নিচের উপায়ে সহজেই তা করা সম্ভব:

```sql
-- টেবিল তৈরি
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);
```

`PostgreSQL` হলো সেই বিরল ডেটাবেজ ম্যানেজমেন্ট সিস্টেম sযা একই সাথে রিলেশনাল ও NoSQL মডেল সাপোর্ট করে, যার কারণে একে অনেকে হাইব্রিড ডেটাবেজও বলে। কয়েক দশক ধরে চলমান ডেভলপমেন্ট, বিশাল সাপর্টিভ কমিউনটি, ফিচার সমৃদ্ধ, এবং নির্ভরযোগ্য হওয়ার কারণে বিশাল জনগোষ্ঠি ও প্রতিষ্ঠানের কাছে `PostgreSQL` একটি ভরসার প্রতীক

<br/>
<br/>

# 2. What is the purpose of a database schema in PostgreSQL?

প্রথমেই আমাদের জানতে হবে `Schema` কী? একটি `Schema` - কে আমরা ডেটাবেজের ভেতরের একটি সাজানো গোছানো জায়গা বা ফোল্ডারের মতো ভাবতে পারি। এখানে আমরা ডেটাবেজের নানান জিনিসপত্র সুন্দরভাবে গুছিয়ে রাখতে পারি। যেমন:

- টেবিল (যেখানে ডেটা রাখা হয়)
- ভিউ (টেবিলের নির্দিষ্ট অংশের একটা সুবিধাজনক ভিউ)
- ফাংশন (কিছু নির্দিষ্ট কাজ করার জন্য কোডের অংশ)
- ইনডেক্স (ডেটা দ্রুত খুঁজে পাওয়ার জন্য)
- টাইপ (নির্দিষ্ট ধরনের ডেটা সংজ্ঞায়িত করতে) ইত্যাদি।

একটি ডেটাবেজে এমন অনেকগুলো স্কিমা থাকতে পারে। প্রতিটি স্কিমাই ওই একই ডেটাবেজের অংশ, কিন্তু তারা নিজেদের মধ্যে আলাদা আলাদাভাবে জিনিসপত্র রাখে। অনেকটা আমাদের কম্পিউটার বা মোবাইলের ভেতরের বিভিন্ন ফোল্ডারের মতো, যেখানে আম্প্রা ছবি, ডকুমেন্ট, গান ইত্যাদি আলাদা আলাদা করে রাখি।

<br/>

`PostgreSQL` - এ `Scehma` ব্যবহারের বেশ কিছু উদ্দেশ্য রয়েছে। যেমনঃ

### ডেটা অর্গানাইজেশন

`Schema` ব্যবহার করে ডেটাবেজ অবজেক্টগুলোকে লজিক্যাল গ্রুপে ভাগ করা যায়। এটি একটি ডেটাবেজকে ছোট ছোট বিভাগে ভাগ করে ডাটা ম্যানেজমেন্ট সহজ করে। যেমনঃ একটি ই-কমার্স ওয়েবসাইটের কথা ধরা যাক। আমরা যদি প্রোডাক্ট, ইউজার, অর্ডার ইত্যাদি ডেটা আলাদা আলাদা চিন্তা করি তাহলে এগুলোকে আমরা ভিন্ন ভিন্ন স্কিমায় রাখতে পারি -

```sql
-- প্রোডাক্ট ম্যানেজমেন্টের জন্য schema
CREATE SCHEMA products;

-- ইউজার ম্যানেজমেন্টের জন্য schema
CREATE SCHEMA users;

-- অর্ডার ম্যানেজমেন্টের জন্য schema
CREATE SCHEMA orders;

-- প্রোডাক্ট schema-তে টেবিল তৈরি
CREATE TABLE products.items (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT
);
```

### অ্যাক্সেস কন্ট্রোল

`Schema` ব্যবহার করে ইউজার লেভেলে পারমিশন ম্যানেজ করা যায় এবং বিভিন্ন ইউজারকে বিভিন্ন schema-তে অ্যাক্সেস দেওয়া বা বন্ধ করা যায়। যেমনঃ ই-কমার্স প্রতিষ্ঠানটিতে অনেক ধরণের এমপ্লয়ি থাকতে পারে। ধরা যাক এক ধরণের এমপ্লয়ি আছেন যারা কাস্টমার সার্ভিস রিপ্রেজেন্টেটিভ যাদের শুধু ইউজার ডাটা দেখার অনুমতি দেয়া হবে -

```sql
GRANT USAGE ON SCHEMA users TO cs_agent;
GRANT SELECT ON users.customers TO cs_agent;

```

### মাল্টি-টেন্যান্সি সাপোর্ট

একাধিক অ্যাপ্লিকেশন বা ক্লায়েন্টের ডাটা একই ডেটাবেজে আলাদা রাখতে schema ব্যবহার করা যায়। ধরা যাক, ই-কমার্স প্লাটফর্মে ৩টি ভিন্ন ভেন্ডর আছে:
ইলেকট্রনিক্স শপ (vendor_electronics), ফ্যাশন স্টোর (vendor_fashion) এবং বুক শপ (vendor_books)। তাহলে, আমাদের ডেটাবেজ দেখতে যেমন হতে পারে -

```sql
-- প্রতিটি ভেন্ডরের জন্য আলাদা schema তৈরি
CREATE SCHEMA vendor_electronics;
CREATE SCHEMA vendor_fashion;
CREATE SCHEMA vendor_books;

-- ইলেকট্রনিক্স ভেন্ডরের প্রোডাক্ট টেবিল
CREATE TABLE vendor_electronics.products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    warranty_period INT
);

-- ফ্যাশন ভেন্ডরের প্রোডাক্ট টেবিল
CREATE TABLE vendor_fashion.products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    size VARCHAR(10)
);
```

### নেমস্পেস ম্যানেজমেন্ট

একই নামের একাধিক টেবিল ভিন্ন schema-তে রেখে নেম কনফ্লিক্ট এড়ানো যায়। ধরি, আমাদের E-commerce সিস্টেমে ২টা users টেবিল আছে:

- মূল user data সংরক্ষণ করে (authentication, registration, login)
- রিপোর্টিং বা বিশ্লেষণের জন্য সংক্ষিপ্ত তথ্য রাখে

নেমস্পেসের কারণে খুব সহজেই আমরা কনফ্লিক্ট এড়িয়ে তা করতে পারি:

```sql
-- স্কিমা তৈরি
CREATE SCHEMA auth;
CREATE SCHEMA analytics;

-- auth স্কিমার user টেবিল
CREATE TABLE auth.users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE,
    password_hash TEXT,
    email TEXT UNIQUE
);

-- analytics স্কিমার user টেবিল
CREATE TABLE analytics.users (
    user_id INTEGER,
    signup_date DATE,
    country TEXT,
    total_orders INTEGER,
    total_spent NUMERIC
);
```

উপরের উদাহরণগুলো থেকে সহজেই বোঝা যাচ্ছে schema ব্যবহারের মাধ্যমে ডেটাকে সহজভাবে এবং সঠিকভাবে ম্যানেজ করা যায়

<br/>
<br/>

# 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

রিলেশনাল ডেটাবেজে ডেটা ব্যবস্থাপনার জন্য এবং ডেটার মধ্যে সম্পর্ক স্থাপনের জন্য `Primary Key` এবং `Foreign Key` খুবই গুরুত্বপূর্ণ দুটি ধারণা। প্রথমেই দেখা যাক `Primary Key` কাকে বলে:

### প্রাইমারি কী (Primary Key)

প্রাইমারি কী হচ্ছে ডেটাবেজের অন্তর্গত কোন এক টেবিলের এক বা একাধিক কলামের(column) সমষ্টি যা সেই টেবিলের প্রতিটি সারি (row) কে অনন্যভাবে (uniquely) আলাদা করতে পারে। অন্যভাবে বলা যায়, প্রতিটি সারি (row) তে এক বা একাধিক কলামের সমষ্টির এমন মান থাকে যা অদ্বিতীয় এবং অন্য সারির অনুরূপ কলাম বা কলামের সমষ্টির মানর সাথে সাদৃশ্যপূর্ণ নয়। এটি প্রতিটি রো-কে সনাক্ত করতে সাহায্য করে, যার ফলে আমরা নির্দিষ্ট ডেটা সহজেই খুঁজে বের করতে পারি এবং একই ডেটা একাধিকবার সংরক্ষণ করা থেকে রক্ষা পাই। এর বৈশিষ্ট্যগুলো হলোঃ

- <b> Unique: </b> প্রতিটি রো-এর জন্য এটি অদ্বিতীয় (Unique), একই টেবিলে দুটি রো-এর Primary Key-এর মান কখনো এক হতে পারবে না।
- <b>NOT NULL: </b> Primary Key কলামের কোনো রো-এর মান কখনোই NULL হতে পারবে না।

#### PostgreSQL উদাহরণ:

ধরা যাক, একটা student টেবিল এর কথা ধরা যাক যেখানে আমরা শিক্ষার্থীদের তথ্য রাখবো। এখানে প্রতিটি শিক্ষার্থীকে আলাদাভাবে চিহ্নিত করার জন্য আমরা student_id কলামটিকে Primary Key হিসেবে ব্যবহার করব।

```SQL
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE
);
```

এই উদাহরণে `student_id` কলামটি `PRIMARY KEY` হিসেবে নির্ধারণ করা হয়েছে। `SERIAL` ডেটাটাইপ স্বয়ংক্রিয়ভাবে একটি unique ক্রমিক সংখ্যা তৈরি করবে, যা `student_id`-কে অদ্বিতীয় থাকতে সাহায্য করবে। যদি আমরা একই `student_id` দিয়ে দুটি এন্ট্রি করতে চাই তখন PostgreSQL একটি Error দিবে।

<br/>

### ফরেন কী (Foreign Key)

`Foreign Key` হলো ডেটাবেজের একটি টেবিলের কলাম বা একাধিক কলামের সেট যা অন্য একটি টেবিলের Primary Key - কে নির্দেশ করে এবং এর মাধ্যমে একটি টেবিলের ডেটা অন্য একটি টেবিলের ডেটার সাথে যুক্ত (relation) করা যায়। `Foreign Key` যে টেবিলের `Primary Key`-কে রেফার করে, সেই টেবিলকে `Parent Table` বা `Referenced Table` বলা হয়। যে টেবিলে `Foreign Key` থাকে, সেই টেবিলকে `Child Table` বা `Referencing Table` বলা হয়। মূলতঃ ডেটাবেজের টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করতে এটি ব্যবহার করা হয়। এর মাধ্যমে -

- Data Consistency নিশ্চিত করা যায়। Child Table-এ শুধুমাত্র বৈধ রেফারেন্স থাকবে, যা Parent Table-এ বিদ্যমান।

- Relationship স্থাপন নিশ্চিত করা যায়। এটি টেবিলগুলোর মধ্যে লজিক্যাল সম্পর্ক তৈরি করে, যা জটিল কোয়েরি এবং ডেটা বিশ্লেষণের জন্য অপরিহার্য।

#### PostgreSQL উদাহরণ:

উপরের শিক্ষার্থীদের উহাহরণ কে বর্ধিত করা যাক। ধরি এই শিক্ষার্থীরা প্রত্যকে এক বা একাধিক বিষয় নিয়ে পড়াশোনা করে। এখন আমরা এই শিক্ষার্থীদের ভর্তিকৃত বিষয়গুলো ব্যবস্থাপনার জন্য একটি courses টেবিল এবং একটি enrollments টেবিল তৈরি করব।

```sql
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    credits INTEGER
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id),
    enrollment_date DATE,
    UNIQUE (student_id, course_id)
);
```

এখানে `enrollments` টেবিলের `student_id` কলামটি একটি `FOREIGN KEY`। এটি `students` টেবিলের `student_id` কে নির্দেশ যা `students` টেবিলের `PRIMARY KEY`। `enrollments` টেবিলে আপনি শুধুমাত্র সেই `student_id` দিতে পারবেন যা `students` টেবিলে ইতিমধ্যেই আছে।

একইভাবে, `enrollments` টেবিলের `course_id` কলামটি একটি `FOREIGN KEY`। এটি `courses` টেবিলের `course_id` কে নির্দেশ করছে।

পরিশেষে বলা যায়, `Primary Key` একটি টেবিলের প্রতিটি রেকর্ডকে স্বতন্ত্রভাবে শনাক্ত করে, আর `Foreign Key` দুটি টেবিলের মধ্যে সম্পর্ক তৈরি করে এবং ডেটার সঠিকতা ও অখণ্ডতা বজায় রাখে। এই দুটি ধারণা একত্রে ব্যবহার করে আমরা একটি নির্ভরযোগ্য ডেটাবেস গঠন করতে পারি।

<br/>
<br/>

# 4. What is the difference between the VARCHAR and CHAR data types?

`PostgreSQL`-এ `VARCHAR` এবং `CHAR` উভয়ই স্ট্রিং (String) ডেটা টাইপ বা অক্ষর সংরক্ষণের জন্য ব্যবহৃত হয়, কিন্তু তাদের মধ্যে কিছু গুরুত্বপূর্ণ পার্থক্য আছে। এই পার্থক্যগুলো ডেটা স্টোরেজ এবং পারফরম্যান্সে প্রভাব ফেলে এবং এসবের উপর ভিত্তি করে তাদের ব্যবহার নির্ধারিত হয়। নিম্নে এদের মধ্যে পার্থক্যগুলো পাশাপাশি উল্লেখ করা হলো:

| বৈশিষ্ট্য    | CHAR(n)                                                     | VARCHAR(n) / VARCHAR                                           |
| ------------ | ----------------------------------------------------------- | -------------------------------------------------------------- |
| দৈর্ঘ্য      | নির্দিষ্ট দৈর্ঘ্য (Fixed-Length)                            | পরিবর্তনশীল দৈর্ঘ্য (Variable-Length)                          |
| প্যাডিং      | ছোট স্ট্রিং হলে স্পেস দিয়ে প্যাডিং হয়                     | কোনো প্যাডিং হয় না                                            |
| স্টোরেজ      | সবসময় নির্দিষ্ট করা সর্বোচ্চ দৈর্ঘ্যের সমান জায়গা নেয়    | ডেটার প্রকৃত দৈর্ঘ্য অনুযায়ী জায়গা নেয় (প্লাস ওভারহেড)      |
| ব্যবহার      | যখন দৈর্ঘ্য সবসময় একই হয়                                  | যখন দৈর্ঘ্য ভিন্ন হতে পারে (সর্বাধিক ব্যবহৃত)                  |
| পারফরম্যান্স | ছোট ডেটা এবং নির্দিষ্ট দৈর্ঘ্যের জন্য কিছুটা দ্রুত হতে পারে | ডেটার আকারের উপর নির্ভর করে, সাধারণত CHAR এর চেয়ে বেশি নমনীয় |

<br/>

#### CHAR (Character) এর উদাহরণ:

```sql
CREATE TABLE example_char (
    -- ২ ক্যারেক্টার নিবে
    country_code CHAR(2)
);

INSERT INTO example_char VALUES ('US'), ('BD'), ('JP');
```

#### VARCHAR (Variable Character) এর উদাহরণ:

```sql
CREATE TABLE example_varchar (
    product_name VARCHAR(100)
);

INSERT INTO example_varchar VALUES ('Laptop'), ('Smartphone X200');
```

পরিশেষে, যদি ডেটা সবসময় ফিক্সড লেংথের হয় তাহকে `CHAR` ব্যবহার করা উত্তম, অন্যথায় `VARCHAR` ব্যবহার করতে হবে

<br/>
<br/>

# 5. How can you modify data using UPDATE statements?

ডেটাবেসে কোনো তথ্য বদলাতে চাইলে আমরা UPDATE স্টেটমেন্ট ব্যবহার করি। এটা অনেকটা এক্সেল ফাইলে নির্দিষ্ট কোনো সেলের ডেটা ম্যানুয়ালি পরিবর্তনের মতো — শুধু SQL দিয়ে।

#### UPDATE স্টেটমেন্টের গঠন:

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

উপরের স্টেটমেন্ট এর অংশগুলো হলোঃ

- `UPDATE table_name`: কোন টেবিলের তথ্য পরিবর্তন করতে চাই।

- `SET column = value`: কোন কলামের মান নতুনভাবে সেট করতে চাই

- `WHERE condition` : কোন রো-এর ডেটা আপডেট হবে তা নির্ধারণ করে।

<br/>

ধরা যাক, আমাদের `students` নামের একটি টেবিল আছে যার ডেটাগুলো নিচে দেওয়া হলো:

| student_id | first_name | last_name | email                    |
| ---------- | ---------- | --------- | ------------------------ |
| 101        | Rakib      | Ahmed     | rakib.ahmed@example.com  |
| 102        | Sadia      | Rahman    | sadia.rahman@example.com |
| 103        | Alif       | Khan      | alif.khan@example.com    |

#### উদাহরণ ১: একটি শিক্ষার্থীর ইমেল ঠিকানা পরিবর্তন যার `id = 101`

```sql
UPDATE students
SET email = 'rakib.hossain@newmail.com'
WHERE student_id = 101;
```

#### উদাহরণ ২: একাধিক কলাম আপডেট করা

```sql
UPDATE students
SET first_name = 'Sumaiya', last_name = 'Islam'
WHERE student_id = 102;
```

এখানে student_id 102 এর নামের প্রথম ও শেষ অংশ পরিবর্তিত হয়ে যাবে।

#### উদাহরণ ৩: WHERE ছাড়া UPDATE

```sql
UPDATE students
SET email = 'unknown@example.com';
```

এই কমান্ডে কোনো `WHERE` নাই, ফলে টেবিলের সব রো-এর ইমেল ঠিকানা একসাথে বদলে যাবে, তাই অত্যন্ত সতর্কতার সাথে update operation চ্যালাতে হবে।

<br/>

সারাংশ:
`UPDATE` দিয়ে আমরা খুব সহজেই কোন টেবিলের ডেটা `"update"`করতে পারি, তবে সাথে সাথে `SET` এবং প্রয়োজন ভেদে `WHERE` ক্লজ এর দরকার হয়। এইভাবে UPDATE স্টেটমেন্ট ব্যবহার করে আমরা ডেটাবেসের তথ্য নিখুঁতভাবে ম্যানেজ করতে পারি।
