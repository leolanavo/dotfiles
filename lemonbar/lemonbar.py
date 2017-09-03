#!/usr/bin/env python3

import i3ipc
import NetworkManager
import os
import sys
import time
import multiprocessing
import subprocess
import re
from shlex import split

def run_script(script):
    path=os.path.realpath(__file__)
    path=os.path.dirname(path)
    p=subprocess.run(['sh',path+"/"+script], stdout=subprocess.PIPE)
    return str(p.stdout)

def i3_plugin(i3, focused_color, unfocused_color, urgent_color, bg_color, focused_bg_color,u_color):
    """Return i3 workspaces information"""
    string = ""
    
    try:
        ws_list = i3.get_workspaces()
    except:
        time.sleep(0.5)
        i3=i3ipc.Connection()
        ws_list = i3.get_workspaces()
    
    for ws in ws_list:
        if ws.urgent:
            string +="%{F"+urgent_color+"}"
        elif ws.focused:
            string +="%{+u}%{U"+u_color+"}%{F"+focused_color+"}%{B"+focused_bg_color+"}"
        else:
            string +="%{F"+unfocused_color+"}"
       
        name=re.sub("[0-9]{1,2}:\ ", "", ws.name)
        string += "  "+name+"  "
        if ws.focused:
            string+="%{B"+bg_color+"}%{-u}"
    
    return string


def wifi_plugin(colors):
    """return wifi status"""
    string=''
    symbol = 'X'
    color = '#FFFFFF'
    symbol= '#'
    name=''
    devices = NetworkManager.NetworkManager.GetAllDevices()
    for device in devices:
        if device.DeviceType == NetworkManager.NM_DEVICE_TYPE_WIFI:
            state = device.State
            #Failed state
            if state <=20 or state == 120: 
                color = colors["white"]
                symbol = '%{B'+colors["red"]+"}%{+u}%{U"+colors["lred"]+"}"+'\uf1eb'+"%{F"+colors["lwhite"]+"}%{-u}"
            #Connected state
            elif state == 100:
                name = run_script("wifi_name.sh")
                name=name[2:len(name)-3]

                color = colors["lwhite"]
                power = device.ActiveAccessPoint.Strength
                symbol = '\uf1eb'
                if power <=25:
                    color = colors["lred"]
                elif power >= 75:
                    color = colors["lwhite"]
                else: 
                    color = colors["lgreen"]
            #Disconnected state
            elif state == 30:
                color = colors["white"]
                symbol = '\uf141'
            #Generic transition state
            else:
                color = colors["lyellow"]
                symbol = '\uf1eb'
            
            menu="networkmanager_dmenu -fn \"RobotoMono-10\" -x 836 -y 23 -sb '#ab1d1b'"
            string="%{F"+color+"}%{A:"+menu+":}"+symbol+"%{F"+colors["lwhite"]+"}  "+name+"%{A}"
    return string

def lan_plugin(colors):
    devices = NetworkManager.NetworkManager.GetAllDevices()
    
    for device in devices:
        
        if device.DeviceType == NetworkManager.NM_DEVICE_TYPE_ETHERNET:
            state = device.State
        
            #Failed state
            if state <=20 or state == 120: 
                color = colors["white"]
                symbol = '\uf127'
            
            #Connected state
            elif state == 100:
                color = colors["lwhite"]
                symbol = '\uf0c1'
            
            #Disconnected state
            elif state == 30:
                color = colors["white"]
                symbol = '\uf127'
            #Generic transition state
            else:
                color = colors["lyellow"]
                symbol = '\uf127'

    string = "%{F" + color + "}" + symbol + "%{F" + colors["lwhite"] + "}"
    return string

def clock_plugin(colors):
    clock = time.strftime("\uf017 %H:%M")
    string = '%{F'+colors["lwhite"]+'}'+clock
    return string

def date_plugin(colors):
    date = time.strftime("\uf073 %e %b")
    string = '%{F'+colors["lwhite"]+'}'+date
    return string

def battery_plugin (colors):
    cmd=str(subprocess.check_output(["acpi"]))
    cmd=cmd.split(",")
    plugged = cmd[0].split(":")[1].replace(" ", "")
    level = str(subprocess.check_output(["acpi"])).split(",")[1]
    level = int(re.sub(r"[A-Z]|[a-z]|\ |\\|\'|%", "", level))
    symbol=''
    color=''

    if (plugged == "Charging"):
        symbol='\uf1e6'
    
    elif (plugged == "Full"):
        symbol='\uf4a1'
    
    else:
        if level<=20:
            symbol='\uf244'
        elif level<=40:
            symbol='\uf243'
        elif level<=60:
            symbol='\uf242'
        elif level<=80:
            symbol='\uf241'
        else: 
            symbol='\uf240'
    
    string=" %{F"+colors["lwhite"]+"}"+symbol+" "+str(level)+"%%{F"+colors["lwhite"]+"}"
    return string

def volume_plugin(colors):
    levelstr = run_script("volume_level.sh");
    mutedstr = run_script("volume_muted.sh");
    string=''
    
    if (len(levelstr) <= 8):
        i = 0
    else:
        i = 1

    levelstr = levelstr.split("\\n")[i]
    for c in levelstr:
        if c.isnumeric():
            string+=c
    
    level=int(string)
    
    if mutedstr[2]=='y':
        muted=True
    else:
        muted=False
    
    string='%{F'+colors["lwhite"]+'}'
    
    if level>0 and not muted:
        if level>=50:
            string+='\uf028' 
        else:
            string+='\uf027'
    else:
        string+='\uf466'
    string+=" %{F"+colors["lwhite"]+"}%3.0f"%level+'%'
    
    
    return string

def spotify_plugin(colors):
    p = run_script("spotify_status.sh")
    
    if (len(p) == 3):
        return ""
    else:
        string="%{F"+colors["lwhite"]+"}\uf1bc "+p[2:len(p)-3]

    return string

def updates_plugin(colors):
    p = run_script("/arch_updates.sh")
    
    p=re.sub(r"[a-z]|[A-Z]|\'|\/|\\", "", p)
    string = "%{F"+colors["lwhite"]+"}\uf300 "+p+"%{F"+colors["lwhite"]+"}" 
    
    return string

def numlock_plugin(colors):
    p = run_script("num_status.sh")

    if (len(p) == 7): 
        string="%{F"+colors["lgreen"]+"}NUM%{F"+colors["lwhite"]+"}"
    else:
        string="%{F"+colors["lwhite"]+"}NUM%{F"+colors["lwhite"]+"}"
    
    return string

def lock_plugin(colors):
    lock_script="i3lock-extra -s -p -o /home/lana/dotfiles/i3/lock"
    string="%{F"+colors["lyellow"]+"}%{A:"+lock_script+":}\uf023%{A}%{F"+colors["lwhite"]+"}"
    return string

def logout_plugin(colors):
    logout="i3-nagbar -t warning -m 'Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
    string="%{F"+colors['lyellow']+"}%{A:"+logout+":}\uf08b%{A}"
    return string

def shutdown_plugin(colors):
    shutdown="i3-nagbar -t warning -m 'Do you really want shutdown the system?' "
    shutdown+="-b 'Shutdown' 'shutdown now' -b 'Reboot' 'reboot'"
    string="%{F"+colors["lred"]+"}%{A:"+shutdown+":}\uf011%{A}"
    return string

def status(i3,levelf,pluggedf,colors):
    """Print the final string that will piped to lemonbar """
    under="%{+u}%{U"+colors['red']+"}"
    spacing="    "
    splitter="  |  "
    s=''
    n=0

    p = run_script("get_monitors.sh")
    p=p[2:len(p) - 3].split("\\n")
    
    for m in p:
        s+="%{S"+str(n)+"}%{B"+colors['black']+"}%{F"+colors['lwhite']+"}%{l}"
    
        s+=i3_plugin(i3,colors['lwhite'],colors['white'],colors['lred'],colors['black'],colors['red'],colors['lwhite'])
    
        s+="%{c}"
        s+=spotify_plugin(colors)

        s+="%{r}"
        s+=under+wifi_plugin(colors)+"%{-u}"+spacing
        s+=under+volume_plugin(colors)+"%{-u}"+spacing
        s+=under+battery_plugin(colors)+"%{-u}"+spacing
        s+=under+numlock_plugin(colors)+"%{-u}"+spacing
        s+=under+date_plugin(colors)+"%{-u}"+spacing
        s+=under+clock_plugin(colors)+"%{-u}"
        s+=splitter 
        
        s+=logout_plugin(colors)+spacing
        s+=shutdown_plugin(colors)+"  "
        n+=1
    return s

def print_status(s):
    """Like status, but will also flush the buffer"""
    print(s)
    sys.stdout.flush()

def i3_print(i3,levelf,pluggedf,colors):
    """Function called by the child process to print the final string """
    
    s=status(i3,levelf,pluggedf,colors)
    print_status(s)

def i3_listener(levelf,pluggedf,colors):
    """It is called by the child process. It will listen to i3 event, and print 
    the status line if there is one, while the father process will print the status 
    if there are changes in the other plugins """
    while 0==0:
        i3=i3ipc.Connection()
        i3.on("workspace::focus",lambda self,e:i3_print(self,levelf,pluggedf,colors))
        i3.on("workspace::urgent",lambda self,e:i3_print(self,levelf,pluggedf,colors))
        i3.main()
        time.sleep(0.5)

if __name__=='__main__':
    #Open battery and ADP files and Xresources file
    try:
        levelf=open("/sys/class/power_supply/BAT0/capacity")
        pluggedf=open("/sys/class/power_supply/AC/online")
    except:
        print("Error while opening bat or plug file")
        exit(0)
    home=os.path.expanduser("~")+"/"
    try:
        xres=open("/home/lana/dotfiles/Xresources")
    except:
        print("Error while opening Xresources")
    line=''
    colors={}
    #Read .Xresources color, if they are at the beginning of the file. 
    #They should be called "color" for dark colors and l"color" for 
    #light ones, like "red" and "lred"
    while line[:7]!="#define":
        line=xres.readline()
    while line[:7]=="#define":
        line=line.replace("\t"," ")
        line=line.replace("\n","")
        fields=line.split(" ")
        colors[fields[1]]=fields[2]
        line=xres.readline()
    #Connect to i3 and create child process
    i3=i3ipc.Connection()
    p=multiprocessing.Process(target=i3_listener,args=(levelf,pluggedf,colors,))
    p.start()
    old_s=''
    #Print s 2 times to fix the background color
    s=status(i3,levelf,pluggedf,colors)
    print_status(s)
    #It will print a new status line only if it's different from the last one. It will check every 0.5 sec,
    #instead of the child process, that is a lot more reactive to i3 events.
    while 0==0:
        s=status(i3,levelf,pluggedf,colors)
        if s != old_s:
            print_status(s)
            old_s = s
        time.sleep(0.5)
    levelf.close()
    pluggedf.close()
