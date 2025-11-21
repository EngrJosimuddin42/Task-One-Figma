# Gravity Wellness App (Flutter)

A modern wellness & lifestyle mobile application built with Flutter.  
This app includes a complete **Onboarding Flow** and an elegant **Sign In Screen** with custom UI components.

---

## ✨ Features

### 🌟 Onboarding Screens (Page 1, 2, 3)
- Beautiful gradient backgrounds
- Animated page indicators
- Custom logo built with layered circles
- Highlighted text using TextSpan
- Smooth scroll with spacing
- Navigation button on each page (`Next >`, `Get Started >`)

---

## 🧩 Onboarding Pages Overview

### **Onboarding Page 1**
- Title: **Welcome to Gravity**
- Describes real-life wellness tracking
- Highlighted text: “Improve your health with smarter insights”
- Footer: “No data shared without your consent.”

### **Onboarding Page 2**
- Title: **Smart Meal Analysis**
- AI-powered meal photo analysis
- Highlight text: “Snap a photo, get instant nutrition insights”

### **Onboarding Page 3**
- Title: **Complete Wellness Tracking**
- Track sleep, hydration, and activity
- Clean UI with gradient background and logo

---

## 🔐 Sign In Screen

### 🔸 Key Features
- Custom user type selector (**Customer / Coach**)
- Gradient header section
- Floating white card UI
- Email & password fields with custom `CustomTextField` widget
- Sign-in validation
- Google and Apple login button UI
- Privacy policy text with clickable span
- Footer: “Don’t have an account? Sign Up”

---

## 🧱 Custom Widgets

### **CustomTextField**
- Custom design (rounded, subtle shadow)
- Supports password toggle
- Icon support
- Reusable in any form

### **UserTypeTab**
- Selectable customer/coach tab
- Animated border + gradient
- Icon with small gear for "Coach"
- Looks like a professional toggle card

### **StackedCirclesLogo**
Used on all onboarding screens (from your design system)

### **GradientButton**
Used on all onboarding pages

---

## 🎨 Colors & Constants
Defined in `colors_and_constants.dart`:

- `primaryDarkBlue`
- `primaryTeal`
- `selectedTabColor`
- `tabUnselectedColor`
- Other theme colors

---

## 📱 Screenshots (Optional)
Add screenshots here later.

---

## 🚀 Getting Started

### 1. Clone the project
```sh
git clone <your-repo-url>
