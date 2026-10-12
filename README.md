# Automated Preview Environments for Pull Requests

## Project Overview

This project aims to automate the creation and cleanup of temporary preview environments for GitHub Pull Requests.

When a developer submits a pull request, the system will create an isolated environment where reviewers can test the changes before merging them into the main branch.

## Objectives

- Automatically create preview environments for pull requests.
- Isolate environments for different pull requests.
- Clean up expired environments using a Time-To-Live (TTL) policy.
- Handle failures during environment creation and cleanup.
- Reduce manual setup and infrastructure costs.

## Planned Technologies

- Linux
- Git and GitHub
- Docker
- GitHub Actions
- Kubernetes
- Python

## Project Status

Phase 1: Project initialization and documentation.