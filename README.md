
# rails-interview / TodoApp

This is a Todo List app built with **Ruby on Rails 7**, **TailwindCSS**, and **Hotwire (Turbo + Stimulus)**. It includes a simple UI and a responsive UX with real-time interactions.

---

## 🚀 Features

- Full CRUD (ABM) for Todo Lists and Todo Items
- TailwindCSS for modern and responsive styling
- Hotwire (Turbo Streams & Frames) for real-time UI updates
- Batch actions: complete all and clear completed items
- Pagination with Kaminari
- Docker-ready development environment
- Tests included

---

## 🛠 Setup

Clone the repository and run:

```bash
bin/setup
```

This will install dependencies, set up the database, and prepare the app for development.

---

## 🐳 Using Docker

To run the app in Docker (recommended):

```bash
docker-compose up
```

This will launch the Rails server and Tailwind watcher automatically via `Procfile.dev`.

To rebuild after making changes to dependencies:

```bash
docker-compose build
```

---

## 💻 Running the App

Once set up, you can access the app at:

```
http://localhost:3000
```

In development, use:

```bash
bin/dev
```

Or, with Docker:

```bash
docker-compose up
```

This starts both Rails and the TailwindCSS watcher.

---

## ✅ Running Tests

To run the test suite:

```bash
bin/rspec
```

Integration test specs are located in a separate repo:  
👉 [https://github.com/crunchloop/interview-tests](https://github.com/crunchloop/interview-tests)

---

## 📚 Documentation

- The root path displays the Todo Lists UI.
- You can add, edit, and delete Todo Lists and Todo Items.
- Use the batch actions on a list's show page to complete or clear multiple items.
- Turbo Streams provide real-time updates to the UI.
- TailwindCSS is used for styling and responsive design.

---

## 📩 Contact

- Santiago Doldán (<sdoldan@crunchloop.io>)
- Gastón Ginestet (<gastonauginestet@gmail.com>)  

---

## 🌀 About Crunchloop

![crunchloop](https://s3.amazonaws.com/crunchloop.io/logo-blue.png)

We strongly believe in giving back 🚀  
Let's work together → [Get in touch](https://crunchloop.io/#contact)
