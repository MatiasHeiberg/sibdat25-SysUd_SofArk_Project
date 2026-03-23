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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly AppFacade _facade;
        public MainWindow(AppFacade facade)
        {
            InitializeComponent();

            _facade = facade;

            VehicleList.ItemsSource = _facade.GetVehicles();
        }

    }
}