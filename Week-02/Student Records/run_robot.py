import os

# Run the Robot Framework test
os.system('robot submissions.robot')

# Pause to see the output (like Windows CMD pause)
input("Press Enter to exit...")



#Run this command
# pip install pyinstaller
# pyinstaller --onefile run_robot.py
#copy .robot file into the generated dist/