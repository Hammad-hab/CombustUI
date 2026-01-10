/* file: simple.c
   compile:
   gcc `pkg-config --cflags --libs gtk+-3.0` -o main main.c
*/
#include <gtk/gtk.h>

int main(int argc, char **argv) {
    GtkWidget *win;
    GtkWidget *label;

    gtk_init(&argc, &argv);

    win = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(win), "No activate() example");
    gtk_window_set_default_size(GTK_WINDOW(win), 400, 200);

    g_signal_connect(win, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    label = gtk_label_new("Hello — no GtkApplication / activate needed.");
    gtk_container_add(GTK_CONTAINER(win), label);

    gtk_widget_show_all(win);
    gtk_main();

    return 0;
}
