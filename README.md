# junior-admin-portfolio
A virtualized enterprise environment simulation (Windows Server 2019 Evaluation + Win10 Pro) featuring Active Directory deployment, GPO hardening, and PowerShell automation scripts for user onboarding and auditing.

Windows AD & Security Lab
Personal home lab project to practice Windows Server administration, PowerShell automation, and security hardening.

 What I did:

[x] Infrastructure: Set up Windows Server 2019 (DC) & Windows 10 Client.

[x] Identity: Created User "Jadzia" and managed OUs.

[x] Automation: Wrote a PowerShell script to audit disk space & specs (export to CSV).

[x] Security (GPO): Blocked Control Panel access for regular users.

 Repository Content:

/scripts - My PowerShell automation scripts.

/evidence - Screenshots and sample reports proving it works.

Proof of Concept:


1. ***Active Directory Setup Domain Controller and connected Client.***

**Fig. 1. Active Directory Forest Provisioning**
*Initializing the new AD environment. Configured the server as the first Domain Controller in a new Forest with the root domain `martti.local`.*
![Forest Setup](evidence/forest_creation.png)

**Fig. 2. Login Screen**  
*Server promoted to DC status, verified by the domain login context (`MARTTI\Administrator`).*
![Domain Login](evidence/domain_admin_login.png)

**Fig. 3. Identity Management (IAM)**
*Active Directory console showing the custom "Procurement" OU and provisioned user "Jadzia".*
![AD Console](evidence/ad_structure.png)


2. ***GPO Hardening in Action User "Jadzia" cannot access Control Panel.***

**Fig 4. GPO Enforcement**
*User "Jadzia" is blocked from accessing the Control Panel.*
![GPO Error](evidence/GPO_error.png)

3. ***PowerShell Automation & Reporting Script generates a CSV report of the machine specs.***
