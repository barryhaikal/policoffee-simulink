# POLICoffee Simulation

The project is done as a prerequisite to complete the course **Industrial Technologies** taught at Politecnico di Milano by **Prof. Sergio Terzi**.

With this model, we are simulating the production process of an Italian coffee machine manufacturer, with respect to process times, process precedence, and setup times.

---

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Setup](#setup)
- [The Production System](#the-production-system)
- [Project Structure](#project-structure)
- [Modeling Assumptions](#modeling-assumptions)

---

## Introduction
**POLICoffee** is an Italian SME operating in the coffee machine manufacturing sector. The company specializes in high-quality espresso machines, balancing artisanal craftsmanship with industrial efficiency. 

In this project, our goal is to model the current production process, highlight its flaws, and apply proposed improvements

## Requirements
To run this repository, the following tools are required
* **MATLAB**
* **Simulink**
* **Plug-ins**: SimEvents, Statistics and Machine Learning

## Setup
In order to visualize production processes, we deploy **Discrete Event Simulations (DES)** using **MATLAB** and **Simulink**.

In Simulink, we used the **SimEvents** library to model graphical blocks of production, while the **Statistics and Machine Learning** plug-in will be used for statistical analysis of the model

The MATLAB environment contains the following key components:
* `Production.slx`: The primary Simulink file used to run the production system. Includes batch processes
* `Production_AsIs.slx`: The As-Is state of the production system, without any changes
* `MTBF_and_MTTR.m`: MATLAB script to initialize signals of availability for the Electric Box and Painting machines. Running the script before simulation is necessary

More detailed explanation can be found in the [Project Structure](#project-structure) section of this README

## The Production System
The production of a POLICoffee machine involves several critical stages:

### 1. As-Is State
The current system is characterized by:
* **Sequential Processing:**

### 2. To-Be State
The proposed simulation explores optimizations such as:
* **Buffer Implementation:** Strategically placing storage units to decouple stations.
* **Parallelization:** Running sub-assembly lines (e.g., electrical components and hydraulic circuits) simultaneously.
* **Reduced Setups:** Grouping production orders to minimize tool changes.

## Project Structure
As mentioned before, the project is divided into several files that run different models of simulation.

To start the project, we must first run `MTBF_and_MTTR.m` to obtain signals for the downtime of several machines

### General structure of the Simulink models

#### Entity Generator
The entity generator is used to

#### Scope

#### Entity Queue

#### Entity Server

#### Entity Input and Output Switches

#### Downtime Signal Modelling

#### Entity Terminator

#### Simulink Functions
`ReadTime`:
`da`

## Modeling Assumptions
To ensure the simulation is statistically significant, the following parameters are applied:
* **Precedence:** Strict logical constraints (Part A must be completed before Part B).
* **Availability:** Consideration of operator shifts and machine breakdown rates (MTTF/MTTR).

---
*Developed solely for academic purposes.*