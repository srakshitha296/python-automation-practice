# 📁 Student Document Submission Tracker

A Robot Framework automation script to manage and track student document submissions.

This tool automatically creates individual folders for students, verifies required file submissions (`Report.txt` and `Resume.txt`), and generates a summary report of pending submissions in both `.csv` and `.txt` formats.

---

## 🚀 Features

- 🗂️ Creates folders for each student (based on USN)
- 📄 Simulates file creation and deletion
- ✅ Checks whether required documents are submitted
- 📋 Generates reports (`.csv`, `.txt`) listing students with missing submissions

---


## 🧰 Technologies Used

- [Robot Framework](https://robotframework.org/)
- Built-in libraries:
  - `OperatingSystem`
  - `Collections`

---

## 🛠️ How It Works

1. **Create Folders and Files**  
   Generates folders named by USNs (e.g., `4JK21CS01`) inside `8th Sem/`, and populates each with `Report.txt` and `Resume.txt`.

2. **Delete Some Files (Simulating Missing Submissions)**  
   A few documents are deleted to simulate real-world missing submissions.

3. **Verify Submissions**  
   Uses `Run Keyword And Return Status` to check for file existence.

4. **Generate Reports**  
   Writes the USNs of students missing files into:
   - `pending_submissions.csv`
   - `pending_submissions.txt`

---

## 📊 Sample Output

**pending_submissions.csv**
```csv
USN
4JK21CS01
4JK21CS03
4JK21CS04

## ▶️ Running the Project
Make sure you have Robot Framework installed.

##  🛠️ Run the test using:
robot student_submission_tracker.robot

   
## 🎓 Use Case
Ideal for teachers handling file-based submissions from multiple students.
This automation reduces manual work in verifying who has submitted the required documents.

## 📄 License
This project is intended for educational and automation learning purposes only.


##  🧪 Built with ❤️ using Robot Framework




