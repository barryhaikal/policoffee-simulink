# POLICoffee Simulation

The project is done as a prerequisite to complete the course **Industrial Technologies** taught at **Politecnico di Milano** by **Prof. Sergio Terzi**.

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
* `1_b_POLICoffee factory case study_annex1_pt2.xlsx`: Excel file consisting of project details

More detailed explanation can be found in the [Project Structure](#project-structure) section of this README

## The Production System
The production of a POLICoffee machine involves several critical stages:

### 1. As-Is State
The current system is characterized by:


### 2. To-Be State
For our version, we decided to purse investments in
* Introducing batch processes
* Automated x
* Removed y

## Project Structure
As mentioned before, the project is divided into several files that run different models of simulation.

To start the project, we must first run `MTBF_and_MTTR.m` to obtain signals for the downtime of several machines

### General structure of the Simulink models
Using SimEvents block, the project models how entities move throughout the production system.

#### Entity Generator
The Entity Generator block generates entities. Entities are discrete items of interest that you can define in a discrete-event simulation

Entity (One entity equals one machine being produced, be it type 10, 11, or others.)

**Further explanation of entity properties are listed as a comment/text in the Simulink model**

#### Scope
Used for
* Obtaining certain data from blocks
* Importing the data to workspace, and conduct further data analysis

#### Entity Queue
Models the queue of the entities, before being processed in servers

In this model, since there are constraints in entity processing prioritization due to reworking, we employ two methods of queueing
* **FIFO**: The normal queue, where the first entity to enter the queue gets processed first
* **Priority Queue**: When testing decides that certain entities should be rework, they are given priority to "skip the line" to ensure fast processing of rework

#### Entity Server
Entity servers are used to model:
* Processes, where entities are processed with defined average processing time and average variation of processing time. This also include setup times
* Testing stations, where entities are processed based on probabilities of quality, predefined in the entity generator. This also include setup times
* However, there is exactly ONE entity server that is used to add extra time, before entering the system, with added time. This is deployed in order to model added setup times when changing batches in production types

#### Entity Input and Output Switches
* **Entity Input Switches** model multiple entities on entrance into one exit
* **Entity Output Switches** model one entity into multiple exit

#### Downtime Signal Modelling
We use the signal generated from the MATLAB script `MTBF_and_MTTR`, and with the **FromWorkspace** block, we import the signal.
The signal is later sent by the **Send** block, which, with an **Entity Gate**, we could model the opening and closing of the gate based on machine downtime

#### Entity Terminator
The entity terminator ends the journey of the entity

There are 3 possible exits:
* Hydraulics testing
* Final testing
* Entity being a completely processed entity

NB: Electronics testing has 0% scrap rate

#### Simulink Functions
`ReadTime`: Function to read time, and make operations (process TTP calculation, modelling end time) based on detected time
`ToWorkspace`: For each TTP, and Time In System at the end of the process, we send the data to workspace for analysis

## Modeling Assumptions
In remodelling the system, these constraints must be respected:

* **Precedence:** Strict logical constraints. If precedence exists, we can not move the process before the predecessor.
* **Availability:** Consideration of operator shifts and machine breakdown rates (MTBF/MTTR). Also we can not change work hours
* **Setup Times:** There are two types of setup times, setup between processes and setup between batches for the entire production line. Setup between processes are modelled according to the last type, while for the line, we created a special entity server to add time before the entire process line begins, based on the product type of the last batch
* **Material Handling:** Can be neglected

---
*This repository is developed solely for academic purposes. We allow this repository to be replicated, with respect to plagiarism regulations of Politecnico di Milano*