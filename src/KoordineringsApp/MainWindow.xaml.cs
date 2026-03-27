using KoordineringsApp.Services;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KoordineringsApp
{
    /// <summary>
    /// Applikationens hovedvindue.
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly AppFacade _facade;

        /// <summary>
        /// Initialiserer hovedvinduet og binder køretøjsdata.
        /// </summary>
        /// <param name="facade">Facade der giver adgang til applikationens use cases.</param>
        public MainWindow(AppFacade facade)
        {
            InitializeComponent();

            _facade = facade;

            VehicleList.ItemsSource = _facade.GetVehicles();
        }

    }
}