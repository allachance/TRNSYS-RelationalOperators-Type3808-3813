# Type3808–3813

Custom set of TRNSYS Types that evaluate relational comparison between two inputs and output a logical signal based on the chosen operator.

## Purpose

```Type3808-3813``` allows simulating relational operators within TRNSYS models. These Types compare inputs using relational operations (```==```, ```!=```, ```>```, ```>=```, ```<```, ```<=```) and output a logical TRUE (1) or FALSE (0). This facilitates condition checks, control logic, and system decision-making in your simulations.

> [!NOTE]  
> TRNSYS already provides relational operators ```EQ```, ```NE```, ```GT```,```GE```,```LT``` and ```LE```  gates within the ```Calculator Type```, which are generally more optimized for simulation speed.  
> The advantage of this set of Types is that they do not require creating custom inputs or outputs within the Calculator, making them easier to integrate and more visually intuitive compared to code-based implementations.

## Requirement

- TRNSYS v.18

## Installation

1. Clone the repo or download the source files:

   ```bash
   git clone https://github.com/allachance/TRNSYS-RelationalOperators-Type3808-3813.git
   ```

2. Copy the folders into your TRNSYS 18 installation directory, e.g., ```C:\TRNSYS18```

## Configuration

### Inputs

| Name               | Description                                 | Options                   |
| ------------------ | ------------------------------------------- | ------------------------- |
| `Input-x`          | 	First input value | —                         |
| `Input-y`          | Second input value | —                         |


### Output
| Name     | Description                                | Options |
| -------- | ------------------------------------------ | ------- |
| `Output` | Logical result of the relational comparison | —       |



## Usage

1. Add the Component in TRNSYS Studio  
   - Insert the desired operators into your simulation workspace: 

     - ```Type3808```: `==`  
     - ```Type3809```: `!=`  
     - ```Type3810```: `>`  
     - ```Type3811```: `>=`  
     - ```Type3812```: `<`  
     - ```Type3813```: `<=`  

2. Connect the two inputs value
   - ```Input x```
   - ```Input y```

3. Use the Output  
   - The `Output` provides a logical value (`0` or `1`) according to relational operation

## Truth Table

### Equal (```Type3808```)

| Input X | Input Y | Output |
| ------- | ------- | ------ |
| 0       | 0       | 1      |
| 0       | 1       | 0      |
| 1       | 0       | 0      |
| 1       | 1       | 1      |

### Not Equal (```Type3809```)

| Input X | Input Y | Output |
| ------- | ------- | ------ |
| 0       | 0       | 0      |
| 0       | 1       | 1      |
| 1       | 0       | 1      |
| 1       | 1       | 0      |


### Greater Than (```Type3810```)

| Input X | Input Y | Output |
| ------- | ------- | ------ |
| 0       | 0       | 0      |
| 0       | 1       | 0      |
| 1       | 0       | 1      |
| 1       | 1       | 0      |


### Greater or Equal (```Type3811```)

| Input X | Input Y | Output |
| ------- | ------- | ------ |
| 0       | 0       | 1      |
| 0       | 1       | 0      |
| 1       | 0       | 1      |
| 1       | 1       | 1      |


### Less Than (```Type3812```)

| Input X | Input Y | Output |
| ------- | ------- | ------ |
| 0       | 0       | 0      |
| 0       | 1       | 1      |
| 1       | 0       | 0      |
| 1       | 1       | 0      |


### Less or Equal (```Type3811```)

| Input X | Input Y | Output |
| ------- | ------- | ------ |
| 0       | 0       | 1      |
| 0       | 1       | 1      |
| 1       | 0       | 0      |
| 1       | 1       | 1      |
