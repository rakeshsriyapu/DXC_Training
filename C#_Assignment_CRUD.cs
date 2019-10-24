using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUD_Employee_List
{

    public class Employee
    {
        private int id;
        private string name, designation, location;
        private int salary;

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }

        public string Designation { get => designation; set => designation = value; }
        public int Salary { get => salary; set => salary = value; }
        public string Location { get => location; set => location = value; }


    }
    class CRUD
    {
        public Employee create()
        {
            Employee employee = new Employee();

            Console.WriteLine("Enter ID: ");
            employee.Id = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter Name:");
            employee.Name = Console.ReadLine();
            Console.WriteLine("Enter Designation:");
            employee.Designation = Console.ReadLine();
            Console.WriteLine("Enter Location:");
            employee.Location = Console.ReadLine();
            Console.WriteLine("Enter Salary:");
            employee.Salary = int.Parse(Console.ReadLine());

            return employee;

        }
        public void read(List<Employee> li)
        {
            foreach (var item in li)
            {
                Console.WriteLine($"{item.Id} - {item.Name} - {item.Location} - {item.Designation} - {item.Salary}");


            }
        }
        public void update(int index, List<Employee> li)
        {
            Employee employee = new Employee();

            Console.WriteLine("Enter ID: ");
            employee.Id = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter Name:");
            employee.Name = Console.ReadLine();
            Console.WriteLine("Enter Designation:");
            employee.Designation = Console.ReadLine();
            Console.WriteLine("Enter Location:");
            employee.Location = Console.ReadLine();
            Console.WriteLine("Enter Salary:");
            employee.Salary = int.Parse(Console.ReadLine());
            li.RemoveAt(index);
            li.Insert(index, employee);

        }
        public void del(int index,List<Employee> li)
        {
            li.RemoveAt(index);
        }

    }
    class Program
    {
        

        public static void Main(string[] args) 
        {
            CRUD crud = new CRUD();
            List<Employee> Emplist = new List<Employee>();
            Emplist.Add(new Employee { Id = 1, Name = "Sayon", Designation = "HR", Location = "NOIDA", Salary = 120000 });
            Emplist.Add(new Employee { Id = 2, Name = "Vinay", Designation = "SW Developer", Location = "USA", Salary = 51000 });
            Emplist.Add(new Employee { Id = 3, Name = "Sarvo", Designation = "SAP Developer", Location = "Pune", Salary = 30000 });
            Emplist.Add(new Employee { Id = 4, Name = "Bhudolia", Designation = "Data analyst", Location = "Chennai", Salary = 50000 });

            while (true)
            {
                Console.WriteLine("Enter Choice: ");
                Console.WriteLine("1.Create\n2.Read\n3.Update\n4.Delete\n5.Exit");
                int choice = int.Parse(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                       Emplist.Add(crud.create());
                        Console.WriteLine("----------Updated List----------");
                        crud.read(Emplist);
                        break;
                    case 2:
                        crud.read(Emplist);
                        break;
                    case 3:
                        Console.WriteLine("Enter the Index which should be updated: ");
                        int index_upd = int.Parse(Console.ReadLine());
                        crud.update(index_upd, Emplist);
                        Console.WriteLine("----------Updated List----------");
                        crud.read(Emplist);
                        break;
                    case 4:
                        Console.WriteLine("Enter the index to delete");
                        int index_del = int.Parse(Console.ReadLine());
                        crud.del(index_del, Emplist);
                        Console.WriteLine("----------Updated List----------");
                        crud.read(Emplist);
                        break;
                    case 5:
                        Environment.Exit(0);
                        break;
                    default:
                        Console.WriteLine("Invalid Entry");
                        break;
                }

            }
        }
    }

 
}
