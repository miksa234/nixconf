{ ... }:
{
  dendritic.data.noctaliaWidgets = {
    center = [
      {
        id = "ActiveWindow";
        hideMode = "hidden";
        maxWidth = 500;
        scrollingMode = "hover";
        showIcon = false;
        textColor = "none";
        useFixedWidth = false;
        fontWeight = "bold";
      }
    ];
    left = [
      {
        id = "Workspace";
        characterCount = 2;
        colorizeIcons = false;
        emptyColor = "none";
        enableScrollWheel = true;
        focusedColor = "none";
        followFocusedScreen = false;
        groupedBorderOpacity = 1;
        hideUnoccupied = false;
        labelMode = "index";
        occupiedColor = "none";
        pillSize = 0.75;
        showApplications = false;
        showApplicationsHover = false;
        showBadge = true;
        showLabelsOnlyWhenOccupied = true;
        unfocusedIconsOpacity = 1;
        fontWeight = "bold";
      }
    ];
    right = [
      { id = "NotificationHistory"; }
      { id = "Battery"; }
      { id = "Bluetooth"; }
      { id = "Volume"; }
      { id = "Network"; }
      {
        id = "SystemMonitor";
        compactMode = false;
        diskPath = "/";
        iconColor = "none";
        showCpuCores = false;
        showCpuFreq = false;
        showCpuTemp = true;
        showCpuUsage = true;
        showDiskAvailable = false;
        showDiskUsage = false;
        showDiskUsageAsPercent = false;
        showGpuTemp = false;
        showLoadAverage = false;
        showMemoryAsPercent = false;
        showMemoryUsage = true;
        showNetworkStats = false;
        showSwapUsage = false;
        textColor = "none";
        usePadding = false;
        fontWeight = "bold";
      }
      {
        id = "Clock";
        formatHorizontal = "HH:mm:ss";
        fontWeight = "bold";
      }
    ];
  };
}
