# Artificial Neural Network - Constitutive Law

This repository contains some Python programs for Artificial Neural Network applicated to Constitutive Laws. This work is related to the following paper:

**Efficient Implementation of Non-linear Flow Law Using Neural Network into the Abaqus Explicit FEM code**

**Abstract**: Machine learning techniques are increasingly used to predict material behavior in scientific applications and offer a significant advantage over conventional numerical methods. In this work, an Artificial Neural Network (ANN) model is used in a finite element formulation to define the flow law of a metallic material as a function of plastic strain $\varepsilon^p$, plastic strain rate $\dot{\varepsilon}^p$ and temperature $T$. First, we present the general structure of the neural network, its operation and focus on the ability of the network to deduce, without prior learning, the derivatives of the flow law with respect to the model inputs. In order to validate the robustness and accuracy of the proposed model, we compare and analyze the performance of several network architectures with respect to the analytical formulation of a Johnson-Cook behavior law for a 42CrMo4 steel. In a second part, after having selected an Artificial Neural Network architecture with $2$ hidden layers, we present the implementation of this model in the Abaqus Explicit computational code in the form of a VUHARD subroutine. The predictive capability of the proposed model is then demonstrated during the numerical simulation of two test cases: the necking of a circular bar and a Taylor impact test. The results obtained show a very high capability of the ANN to replace the analytical formulation of a Johnson-Cook behavior law in a finite element code, while remaining competitive in terms of numerical simulation time compared to a classical approach.

## Structure

This repository contains the following directories:

* ANN-Johnson-Cook : Identification of a Johnson-Cook flow law using the ANN
* ANN-Zhou-Law : A constitutive law data taken from the literature
* Abaqus : Testing of the VUHARD subroutines on the Abaqus FEM code



## Programs

ANN-Learning.ipynb : main program used to train the Neural Network

PythonToFortran-3layers.ipynb : Program to convert an ANN to a Fortran VUHARD subroutine



***

Olivier Pantalé  
Full Professor of Mechanics  
email : olivier.pantale@enit.fr

Laboratoire Génie de Production  
Ecole Nationale d'Ingénieurs de Tarbes  
Université de Toulouse  
47 Avenue d'Azereix - BP 1629  
65016 TARBES - CEDEX - FRANCE