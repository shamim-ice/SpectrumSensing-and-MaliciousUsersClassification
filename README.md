# SpectrumSensing-and-MaliciousUsersClassification

The Cognitive Radio based Internet of Things (CR-IoT) is a promising technology that provides IoT endpoints, i.e., CR-IoT users the capability to share the radio spectrum otherwise allocated to licensed Primary Users (PUs). Cooperative Spectrum Sensing (CSS) improves spectrum sensing accuracy in a CR-IoT network. However, its performance may be degraded by potential attacks of the malicious CR-IoT users that send their incorrect sensing information to the corresponding Fusion Center (FC). This study presents a promising Machine Learning (ML)-based malicious user detection scheme for a CR-IoT network that uses a Support Vector Machine (SVM) algorithm to identify and classify malicious CR-IoT users.


### Spectrum sensing:
- [Energy vector](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/EnergyVector.m): A MATLAB model to create the energy vector using the spectrum sensing results of both normal and malicious users.


### Detection Probability:
- [Detection probability](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/DetectionProbability.m): Probability of detection when Always malicious users, Always No malicious users, and Random malicious users exist and after excluding malicious users.

![Alt text](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/detection_Probability.png)

### Malicous Users Detection:
- [Always Yes Malicious User detection](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/AYMUdetection.ipynb): 
   
   ![Alt text](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/aymus.png)
 
- [Always No Malicious User detection](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/ANMUdetection.ipynb): 
   
   ![Alt text](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/anmus.png)
   
- [Random Malicious User detection](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/MUdetection.ipynb): 
   
   ![Alt text](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/rmus.png)
   
### Simulation Results:
- [Confusion matrix and AUC](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/CR_IoT.ipynb):

  ![Alt text](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/confusion_mat.png) 
  ![Alt text](https://github.com/shamim-ice/SpectrumSensing-and-MaliciousUsersClassification/blob/main/AUC.png) 

