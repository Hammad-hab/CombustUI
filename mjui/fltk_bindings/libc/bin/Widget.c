#include <gtk/gtk.h>

int
main (int    argc,
      char **argv)
{
  GtkApplication *app;
  

  app = gtk_application_new ("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);


  status = g_application_run (G_APPLICATION (app), argc, argv);
  g_object_unref (app);

  return status;
}
