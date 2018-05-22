using System;
using System.IO;
using System.Security.Permissions;
using System.Diagnostics;

public class Watcher
{

    public static void Main()
    {
    Run();

    }

    [PermissionSet(SecurityAction.Demand, Name="FullTrust")]
    public static void Run()
    {
        string[] args = System.Environment.GetCommandLineArgs();

        // If a directory is not specified, exit program.
        if(args.Length != 2)
        {
            // Display the proper way to call the program.
            Console.WriteLine("Usage: Watcher.exe (directory)");
            return;
        }

        // Create a new FileSystemWatcher and set its properties.
        FileSystemWatcher watcher = new FileSystemWatcher();
        // watcher.Path = args[1];
        watcher.Path = @"{1:path-to-watch}";    
        /* Watch for changes in LastAccess and LastWrite times, and
           the renaming of files or directories. */
        watcher.NotifyFilter = NotifyFilters.LastAccess | NotifyFilters.LastWrite
            | NotifyFilters.FileName | NotifyFilters.DirectoryName;
        // Only watch text files.
        watcher.Filter = "deploy.txt";

        // Add event handlers.
        // watcher.Changed += new FileSystemEventHandler(OnChanged);
        watcher.Created += new FileSystemEventHandler(OnCreated);
        //watcher.Deleted += new FileSystemEventHandler(OnChanged);
        watcher.Renamed += new RenamedEventHandler(OnRenamed);

        // Begin watching.
        watcher.EnableRaisingEvents = true;

        // Wait for the user to quit the program.
        Console.WriteLine("Press \'q\' to quit the sample.");
        while(Console.Read()!='q');
    }

    // Define the event handlers.
    private static void OnCreated(object source, FileSystemEventArgs e)
    {
        // Specify what is done when a file is changed, created, or deleted.
        Console.WriteLine("File: " +  e.FullPath + " " + e.ChangeType);
        File.Delete( @"{1:path-to-watch}\deploy.txt");       
        Process.Start("{2:process-to-start}.exe");

    }

    private static void OnRenamed(object source, RenamedEventArgs e)
    {
        Console.WriteLine("File: " +  e.FullPath + " " + e.ChangeType);
        File.Delete( @"{1:path-to-watch}\deploy.txt");       
        Process.Start("{2:process-to-start}.exe");
    }
}