# Task Management System

A Task Management System built with Flutter, implementing Clean Architecture and Test-Driven Development (TDD) principles. The project uses GetIt for dependency injection and Bloc/Cubit for state management. Tasks are stored both online using Firestore and offline using `sqflite`.

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Dependency Injection](#dependency-injection)
- [Offline and Online Support](#offline-and-online-support)

## Features

- Add new tasks
- Delete tasks
- View a list of tasks
- Delete tasks from both server and local storage
- Edit tasks from both server and local storage
- Persist tasks with Firestore
- Offline storage with `sqflite` to ensure tasks are available without an internet connection

## Architecture

This project follows the principles of Clean Architecture to maintain a scalable, testable, and maintainable codebase. The architecture is divided into the following layers:

- **Presentation Layer**: Contains UI code and state management (Bloc/Cubit).
- **Domain Layer**: Contains business logic and entities.
- **Data Layer**: Contains data sources, repositories, and models.

## State Management

State management is handled using the Bloc/Cubit library, which provides a predictable state management solution. The app uses Blocs and Cubits to manage state changes and handle business logic.

## Dependency Injection

The project uses GetIt for dependency injection, making it easier to manage dependencies and improve testability. The `get_it` package is used to register and resolve dependencies throughout the app.

## Offline and Online Support

The app uses Firestore for online data persistence and `sqflite` for offline storage. This ensures that tasks are available to the user even when there is no internet connection. The app synchronizes data between the online and offline databases.