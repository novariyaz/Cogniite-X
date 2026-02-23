Cogniite X 🧠

A premium AI-powered smart notes mobile app — initially inspired by NotebookLM, built to be better on mobile.

🧠 About

"At the end of the day — it's all about Human Brain + LLM Brain working together.
Don't forget, the LLM does what you tell it. You still have to be the smart one." 😄

Cogniite X is a mobile-first AI notes application where users upload documents, PDFs,
YouTube links, images, and websites — then interact with an AI that answers questions
grounded ONLY in their uploaded sources. No hallucinations. Just your knowledge, supercharged.
The project started as a deep study of NotebookLM's mobile experience — analysing their
design decisions, UX flows, and feature gaps — then building a better, mobile-first version
with a premium custom design language and features NotebookLM mobile doesn't have yet.

🆚 Cogniite X vs NotebookLM Mobile
FeatureCogniite XNotebookLM MobilePremium Dark UI with Neon Effects✅❌Liquid Glass Button Effects✅❌Full Study Tools on Mobile✅ All 5⚠️ LimitedImage as Source✅❌Smart Search with Filters✅⚠️ BasicAI Model Selection✅❌ LockedUser Profile & Personalization✅❌Animated RGB UI Elements✅❌Audio Overview✅✅AI Chat from Sources✅✅

✨ Features
FeatureDescription📁 NotebooksCreate and manage multiple AI notebooks🤖 AI ChatChat with AI grounded only in your sources🎙️ Audio OverviewPodcast-style AI discussion of your notes📚 Study ToolsSummary, Study Guide, FAQ, Key Takeaways, Timeline🔍 Smart SearchSearch with filter chips and suggested topics🖼️ Image SourceUpload images as source material⚙️ AI Model SelectorChoose your preferred AI model👤 PersonalizationProfile, avatar, language, and preferences

🛠️ Tech Stack
TechnologyPurposeFlutter & DartCross-platform mobile app frameworkGemini APIAI chat and content generationFirebase AuthGoogle Sign-In authenticationCloud FirestoreReal-time notebook and source databaseFirebase StorageFile and document upload storageCustomPainterAnimated RGB neon borders and custom logoBackdropFilterLiquid Glass frosted button effect
🤖 AI Agents & Development Tools
ToolRole in DevelopmentAI Agents (Google Antigravity)Autonomous code generation agents — handled Flutter boilerplate, screen implementation, and iterative fixes without manual codingGoogle StitchAI design agent for early UI layout explorationClaude (Anthropic)AI technical advisor — architecture planning, prompt engineering, screen-by-screen code review

Fun fact: The AI agents wrote the code. The human told them what to write, reviewed everything, and said "no, make it more premium" about 47 times. 😄


🎨 Design System
ElementValuePrimary Background#1C1E27 deep dark navyCard Background#1E2030Primary Accent#6C63FF indigo purpleSecondary Accent#00D4FF cyanSuccess Green#4ADE80Modal Background#252730
Special UI Effects:

🌟 Neon ambient radial glow on background
🌈 Animated SweepGradient RGB rotating neon borders
🫧 BackdropFilter Liquid Glass frosted button (iOS 26 inspired)
🎨 Custom gradient C-logo via CustomPainter


📸 Screens
#ScreenDescription1🏠 HomeEmpty state + Liquid Glass Create button with RGB border2➕ Add SourceBottom sheet — PDF, Audio, Image, Website, YouTube, Text3📓 Notebook DetailSources tab + AI Chat tab with arc avatar4🎙️ Audio OverviewPodcast player — animated waveform + live transcript5📚 Study Tools5 AI tools — Summary, Guide, FAQ, Takeaways, Timeline6🔍 SearchSmart search with filter chips and suggested topics7⚙️ SettingsProfile, Preferences, AI Settings, About

🚀 Getting Started
Prerequisites

Flutter SDK 3.0+
Dart SDK
Android Studio or VS Code
Firebase project

Installation
bash# Clone the repo
git clone https://github.com/YOUR_USERNAME/cogniite-x.git

# Enter project
cd cogniite-x

# Install dependencies
flutter pub get

# Run the app
flutter run
Firebase Setup

Create project at console.firebase.google.com
Add Android/iOS app
Download google-services.json → place in /android/app/
Enable Auth, Firestore, and Storage


🗺️ Roadmap

 Complete UI — all 7 screens
 Custom brand identity — Cogniite X
 Premium neon glow ambient background
 Animated RGB neon borders
 Liquid Glass button (iOS 26 inspired)
 Full screen navigation flow
 Firebase Auth — Google Sign In
 Firestore — real notebook storage
 Gemini API — real AI chat
 PDF and file processing
 Audio Overview with Text-to-Speech
 Image source processing
 Offline mode
 Version 2 — competitive analysis improvements


💡 Development Philosophy

"The best developers of the next decade won't be the ones who avoid AI —
they'll be the ones who know how to direct it." 🧠🤖

This project was built with a Human + AI collaborative approach —

Human → Research, design decisions, architecture, quality review, creative direction
AI Agents → Code generation, iteration, debugging, boilerplate

Every screen was personally reviewed and iterated multiple times.
The AI wrote what I told it to. I made sure it was actually good. 😄
Development Phases:

🔍 Research — Studied NotebookLM mobile screen by screen
🎨 Design — Designed screens and component system
🏗️ Build — Flutter development with AI agent assistance
👁️ Review — Visual review and iteration of every screen
✨ Polish — RGB effects, Liquid Glass, neon glows


📄 License
MIT License — use this as inspiration for your own projects!

🙋 Author
Designed and developed by Riyaz.
Built with 50% Human Brain + 50% LLM Brain = 100% Cogniite X 🧠🤖
Feedback, issues, and stars all welcome! 
