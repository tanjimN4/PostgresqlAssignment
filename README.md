# 1.What is PostgreSQL?

PostgreSQL হলো একটি শক্তিশালী, ওপেন সোর্স অবজেক্ট-রিলেশনাল ডেটাবেইজ ম্যানেজমেন্ট সিস্টেম (ORDBMS)। এর মাধ্যমে আমরা কম্পিউটারে বড় পরিমাণ তথ্য সংরক্ষণ, খোঁজা এবং বিশ্লেষণ করতে পারি খুব সহজে।

🔷 PostgreSQL কেমন কাজ করে?
একটি দোকান কল্পনা করুন যেখানে আলাদা আলাদা তাক বা শেলফে পণ্য রাখা হয় — PostgreSQL-এ সেই শেলফগুলো হলো টেবিল। প্রতিটি টেবিলে থাকে সারি (rows) এবং কলাম (columns) — যেগুলো একেকটি তথ্যের ধরণ ও মান সংরক্ষণ করে।

🔷 কেন PostgreSQL ব্যবহার করবো?

1| এটি ফ্রি এবং ওপেন সোর্স — ব্যবহার ও পরিবর্তন করতে কোনো লাইসেন্স লাগে না।

2| বৃহৎ পরিসরের ডেটা হ্যান্ডেল করতে পারে (Big Data এর জন্য উপযোগী)।

3| জটিল কোয়েরি (Complex Queries) খুব দ্রুত চালাতে পারে।

4| এটি ACID কমপ্লায়েন্ট — অর্থাৎ এটি ডেটার নিরাপত্তা, নির্ভুলতা ও নিরবিচারে ব্যবহার নিশ্চিত করে।

5| Web App, Mobile App, API, SaaS ইত্যাদি যেকোনো ধরনের অ্যাপ্লিকেশনে ব্যবহারযোগ্য।

# 2. What is the purpose of a database schema in PostgreSQL?

Schema হলো ডেটাবেইজের মধ্যে একটি সংগঠিত "ফোল্ডার" বা "নেমস্পেস", যেখানে টেবিল, ভিউ, ফাংশন, ইত্যাদি একত্রে গুছিয়ে রাখা হয়।

🔷 স্কিমা ব্যবহারের উদ্দেশ্য:

1| ডেটা গ্রুপিং: একই ধরণের টেবিল একসাথে রাখা যায়। যেমন – sales, inventory, user_management আলাদা স্কিমাতে রাখতে পারি।

2| নাম দ্বন্দ্ব এড়ানো: দুটি স্কিমাতে একই নামের টেবিল থাকলেও সমস্যা হয় না।

যেমন: admin.users এবং public.users

3| অ্যাক্সেস কন্ট্রোল: প্রতিটি স্কিমার জন্য ভিন্ন ভিন্ন পারমিশন সেট করা যায়।

4| ডেটাবেইজ মডিউলার করা: বড় অ্যাপ্লিকেশনকে ছোট ছোট অংশে ভাগ করে সহজে ব্যবস্থাপনা করা যায়।

# 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
 
# Primary Key (প্রাইমারি কি) কী?

প্রাইমারি কি হলো একটি টেবিলের এমন একটি কলাম যা প্রতিটি রেকর্ডকে অন্য সব রেকর্ড থেকে আলাদা করে। এটি UNIQUE এবং নাল NULL হতে পারে না।

#  Foreign Key (ফরেন কি) কী?

ফরেন কি হলো এমন একটি কলাম যা অন্য একটি টেবিলের প্রাইমারি কির সাথে সংযুক্ত থাকে। এর মাধ্যমে টেবিলগুলোর মধ্যে সম্পর্ক (relationship) তৈরি হয়।


# 4. What is the difference between the VARCHAR and CHAR data types?

ধরো তুমি একটা লাইব্রেরিতে কাজ করো। প্রতিটি বইয়ের একটা বইয়ের কোড (Book Code) এবং বইয়ের নাম (Book Name) থাকে।


# Book Code (CHAR)

সব বইয়ের কোডই ঠিক ৫ অক্ষরের (যেমন: BK001, BK002)। তাই তুমি এটা বানাবে CHAR(5) দিয়ে।

```sql
book_code CHAR(5)
```

এটা fixed length। তুমি যদি শুধু BK1 লিখো, তাহলে PostgreSQL মনে মনে এটা বানাবে: 'BK1 ' — মানে স্পেস দিয়ে ফাঁকা পূরণ করবে।

# Book Name (VARCHAR)

তবে বইয়ের নাম তো বড়, ছোট সব রকম হতে পারে, তাই নামের জন্য ব্যবহার করো:

```sql
book_name VARCHAR(100)
```
এখানে তুমি চাইলে  Data বা Algorithms and Structures — যেকোনো দৈর্ঘ্যের নাম রাখতে পারো (১০০ অক্ষরের মধ্যে হলে)।

# 5.Explain the purpose of the WHERE clause in a SELECT statement.

WHERE clause হলো SQL-এর সেই অংশ যেটা দিয়ে তুমি ঠিক করো "আমি শুধু এই শর্তের রেকর্ডগুলো চাই।"

এখন তুমি চাও শুধু ১৮ বছরের বেশি বয়সীদের নাম দেখতে।
```sql
SELECT * FROM students
WHERE age > 18;
```

# 6. What are the LIMIT and OFFSET clauses used for?

LIMIT ➝ কত টি রেকর্ড রিটার্ন করবে, সেটা নির্ধারণ করে

```sql
শুধু প্রথম ৫ জন
SELECT * FROM students
LIMIT 5;
```

OFFSET ➝ কত টি রেকর্ড স্কিপ করবে, সেটি নির্ধারণ করে

```sql
প্রথম ৫ জন বাদ দিয়ে পরের ৫ জন
SELECT * FROM students
LIMIT 5 OFFSET 5;
```
LIMIT এবং OFFSET দরকার হয় যখন অনেক ডেটার মধ্যে থেকে অল্প কিছু রেকর্ড দেখাতে চাই, যেমন Pagination বা Infinite Scroll-এর ক্ষেত্রে। এতে করে অ্যাপ দ্রুত কাজ করে এবং ইউজার একসাথে সব ডেটা না দেখে ধাপে ধাপে দেখতে পারে।

# 7. How can you modify data using UPDATE statements?

UPDATE কমান্ড ব্যবহার করে PostgreSQL-এ কোনো টেবিলের বিদ্যমান তথ্য পরিবর্তন করা যায়।

 students টেবিলের মধ্যে id = 3 যেই ছাত্র, তার বয়স ২০ থেকে ২১ করতে চাই:

```sql
 UPDATE students
SET age = 21
WHERE id = 3;
```


# 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

JOIN দুটি বা ততোধিক টেবিলের মধ্যে সম্পর্কিত ডাটা কম্বাইন করতে ব্যবহৃত হয়। প্রধান ধরনের JOIN গুলো হল:
- INNER JOIN: শুধু ম্যাচিং রো
- LEFT JOIN: বাম টেবিলের সব রো + ডান টেবিলের ম্যাচিং রো
- RIGHT JOIN: ডান টেবিলের সব রো + বাম টেবিলের ম্যাচিং রো

# 9. Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY ক্লজ একই মানের রোগুলোকে গ্রুপ করে এবং অ্যাগ্রিগেট ফাংশন প্রয়োগ করতে দেয়:
```sql
SELECT department, COUNT(*) 
FROM employees 
GROUP BY department;
```

# 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

PostgreSQL-এ সাধারণ অ্যাগ্রিগেট ফাংশনসমূহ:
- **COUNT()**: রো সংখ্যা রিটার্ন করে
- **SUM()**: সংখ্যাসূচক ভ্যালুর সমষ্টি
- **AVG()**: সংখ্যাসূচক ভ্যালুর গড়
- **MAX()/MIN()**: সর্বোচ্চ/সর্বনিম্ন ভ্যালু

```sql
-- কতজন ছাত্র আছে?
SELECT COUNT(*) FROM students;

-- ছাত্রদের মোট বয়স যোগফল
SELECT SUM(age) FROM students;

-- ছাত্রদের গড় বয়স
SELECT AVG(age) FROM students;

--সর্বোচ্চ বয়স দেখতে (MAX)
SELECT MAX(age) FROM students;

--সর্বনিম্ন বয়স দেখতে (MIN)
SELECT MIN(age) FROM students;

```