# TeamHive 🐝

**TeamHive** is a robust Project Management System built with **Ruby on Rails 7**. It was designed specifically to demonstrate advanced ActiveRecord associations, complex data modeling, and modern frontend styling using Tailwind CSS.

## 🚀 Key Features & Technical Concepts

This project implements four distinct types of database associations in a single, cohesive application:

### 1. Polymorphic Associations (Comments)
* **Concept:** A single `Comment` model is used for discussions on multiple parent types.
* **Implementation:** Comments can be attached to both `Projects` (High-level discussion) and `Tasks` (Implementation details) using the `commentable_type` and `commentable_id` pattern.
* **UI:** A shared partial renders discussions seamlessly across different views.

### 2. Self-Join Association (Organizational Chart)
* **Concept:** A recursive relationship where a User belongs to another User.
* **Implementation:** Users have a `manager_id` foreign key pointing to the `users` table.
* **UI:** The User Dashboard visually displays the hierarchy: "Reports To" (Manager) and "Direct Reports" (Subordinates).

### 3. Has Many Through (Team Assignments)
* **Concept:** A Many-to-Many relationship with extra data on the join table.
* **Implementation:** Users are assigned to Projects via an `Assignment` model.
* **Extra Data:** The assignment tracks the specific `role` (e.g., "Lead Dev", "QA") the user plays on that specific project.

### 4. Has And Belongs To Many (HABTM)
* **Concept:** A simple Many-to-Many relationship without extra data.
* **Implementation:** `Tasks` can be tagged with multiple `Tags` (e.g., Bug, Urgent, Backend).
* **UI:** A "Tag Explorer" allows users to find all tasks across the system associated with a specific tag.

---

## 🛠 Tech Stack

* **Backend:** Ruby on Rails 7
* **Database:** SQLite (Development)
* **Frontend:** Tailwind CSS (via `tailwindcss-rails`)
* **Icons:** Heroicons (SVG)
* **Authentication:** Devise (Customized Views & Controllers)
* **Pagination:** Will Paginate (Custom Tailwind Styling)

---

## 📸 Application Highlights

* **Interactive Dashboard:** Visual progress bars for projects based on task completion.
* **Task Board:** Workflow management (Backlog -> In Progress -> Done) with visual status indicators.
* **Secure Auth:** Full Sign-Up/Log-In flow with custom fields (First Name, Last Name, Job Title).
* **Responsive Design:** Mobile-friendly grid layouts and navigation.

---

## ⚙️ Local Setup Guide

Follow these steps to get the project running on your local machine:

**1. Clone the repository**
```bash
git clone [https://github.com/yourusername/teamhive.git](https://github.com/yourusername/teamhive.git)
cd teamhive
```