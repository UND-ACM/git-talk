---
title: GitHub - Organization and Automation
author: UND Association for Computing Machinery
institute: https://linktr.ee/UND_ACM
date: \today
theme: Warsaw
colortheme: spruce
fontsize: 12pt
aspectratio: 169
header-includes: |
    \usepackage{hyperref}
    \hypersetup{colorlinks=true,urlcolor=blue}

---

# Overview

Three Examples

1. Issues, Pull Requests, and Unit Testing
2. Releases and Cross-Compilation
3. Packages and Docker

# What's CI/CD?

## Continuous Integration

 - Automated building and testing
    - Packaging, unit testing, security checks, etc.
 - Widely available

## Continuous Deployment

 - Automated provisioning
 - Kicks in after CI
 - Examples not in today's scope

# Example 1: Issues, PRs, Unit Tests

## Definition: Unit Testing

Unit testing is the practice of validating that a particular section of code
produces a particular output given a certain input.

## Scenario

You've recently begun an internship at Organization LLC. For your first assignment,
you've been tagged in an issue on the organization's primary repo and must make the
changes requested. Your goal is to commit your changes into the `main` branch.

# Example 2: Releases, Cross-Compilation

## Definition: Cross-Compilation

Cross-compilation is the act of building for one particular target from a host running
a different architecture or operating system.

## Scenario

As a maintainer of a popular command-line application, you're tasked with ensuring
that in-demand operating systems and architectures have builds of your software available.

# Example 3: Packages, Docker

## Definition: Docker

Docker is a tool for running containerized applications. Similar to VirtualBox, but without
a GUI or window to interact with containers.

## Scenario

As the author of a web service deployed at a variety of client businesses, you utilize
Docker to ensure that dependency management and environment configuration can be kept
predictable across a broad variety of server configurations. For optimal efficiency, you'd
like to build your images remotely before downloading to servers for deployment.

