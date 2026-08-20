# Traffic Light Controller FSM

I made this project to understand how a real-world traffic light system can be designed using **Verilog and a Finite State Machine (FSM)**.

The idea is very simple. Suppose **two roads, Road A and Road B, meet at one junction**. Both roads cannot be allowed to move at the same time because vehicles could collide.

So, when Road A gets a **green light**, Road B gets a **red light**. After some time, Road A changes to **yellow**, and then Road B gets the green light.

The controller keeps repeating this sequence.

### Basic working

* 🟢 Road A Green → Road B Red
* 🟡 Road A Yellow → Road B Red
* 🔴 Road A Red → Road B Green
* 🔴 Road A Red → Road B Yellow
* Then it goes back to the first state.

I used an **FSM** to represent these different situations as states.

The main things I defined were:

* **Input:** Clock, Reset, and Timer Done
* **Output:** Red, Yellow, and Green signals for both roads
* **States:** Different traffic-light conditions
* **Current State:** Stores where the controller is currently
* **Next-State Logic:** Decides what should happen next
* **State Register:** Updates the state according to the clock

The basic flow is:

```text
Current State
      ↓
Next-State Logic
      ↓
Next State
      ↓
State Register
      ↓
Clock
      ↓
Current State
```

### Why I built it

I wanted to move beyond just learning Verilog syntax and actually use it to design a small digital system.

This project helped me understand how **FSMs, combinational logic, sequential logic, clock signals, reset, and RTL design** come together to control a real-world system.

It is a simple project, but it gave me a better understanding of how a hardware controller is designed from an idea into RTL.
