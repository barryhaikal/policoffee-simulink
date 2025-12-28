# POLICoffee Simulation

The project is done as a prerequisite to complete the course **Industrial Technologies** taught at Politecnico di Milano by **Prof. Sergio Terzi**.

With this model, we are simulating the production process of an Italian coffee machine manufacturer, with respect to process times, process precedence, and setup times.

---

## Table of Contents
- [Introduction](#introduction)
- [The Production System](#the-production-system)
- [Modeling Assumptions](#modeling-assumptions)
- [Project Structure](#project-structure)
- [Key Performance Indicators (KPIs)](#key-performance-indicators-kpis)

---

## Introduction
**POLICoffee** is an Italian SME operating in the coffee machine manufacturing sector. The company specializes in high-quality espresso machines, balancing artisanal craftsmanship with industrial efficiency. 

As demand fluctuates, the company seeks to optimize its production flow to maintain competitiveness in the "Made in Italy" market.

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

## Modeling Assumptions
To ensure the simulation is statistically significant, the following parameters are applied:
* **Precedence:** Strict logical constraints (Part A must be completed before Part B).
* **Availability:** Consideration of operator shifts and machine breakdown rates (MTTF/MTTR).

## Project Structure
The MATLAB environment contains the following key components:
* `Production.slx`: The primary Simulink file used to run the production system.
* `MTBF_and_MTTR.m`: MATLAB script to initialize signals of availability for the Electric Box and Painting machines. Running the script before simulation is necessary

## Key Performance Indicators (KPIs)
The model evaluates the success of the production system through:
* **Throughput (TH):** Units produced per hour.
* **Cycle Time (CT):** Total time from raw material entry to finished product.
* **Work in Progress (WIP):** Average number of units currently in the system.
* **Machine Utilization:** Percentage of time machines are actively value-adding.

---
*Developed solely for academic purposes.*