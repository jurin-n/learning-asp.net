using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace WingtipToys.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            OrderedDictionary od = new OrderedDictionary();
            od.Add("B", "bbb");
            od.Add("C", "ccc");
            Console.WriteLine(od[1]);
            od.Insert(1, "D", "ddd");
            Console.WriteLine(od[1]);

            Dictionary<String, int> d = new Dictionary<String, int>();
            int i = 0;
            foreach (DictionaryEntry de in od)
            {
                Console.WriteLine(de.Key + ", " + de.Value);
                d.Add(de.Key.ToString(), i);
                i++;
            }
            Console.WriteLine("B=" + getPosition("B", od));
            Console.WriteLine("C=" + getPosition("C", od));

        }

        [TestMethod]
        public void TestMethod2()
        {
            List<ColumnOfOneTable> columnPlot = new List<ColumnOfOneTable>();
            OrderedDictionary od = new OrderedDictionary();

            ColumnOfOneTable columnOfOneTable = new ColumnOfOneTable { 
                 columnName = "B"
                ,isPkey = true
                ,dispNo = 1
            };

            columnPlot.Add(columnOfOneTable);
            od.Add("B", columnPlot);
            /*
            foreach (DictionaryEntry de in od)
            {
                Console.WriteLine(de.Key);
                Console.WriteLine(de.Value);
            }
            */

            Console.WriteLine("using potision.");
            Console.WriteLine(od[getPosition("B", od)]);

            Console.WriteLine("using key.");
            Console.WriteLine(od["B"]);

            List<ColumnOfOneTable> hoge = (List<ColumnOfOneTable>)od["B"];
            Console.WriteLine(hoge[0].dispNo);

            ColumnOfOneTable columnOfOneTable2 = new ColumnOfOneTable
            {
                columnName = "B"
               ,isPkey = true
               ,dispNo = 2
            };
            hoge.Add(columnOfOneTable2);


            List<ColumnOfOneTable> hoge2 = (List<ColumnOfOneTable>)od["B"];
            Console.WriteLine(hoge2[1].dispNo);
        }

        [TestMethod]
        public void TestMethod3()
        {
            OrderedDictionary od = new OrderedDictionary();
            int capacity = 3;
            ColumnOfOneTable columnOfOneTable01_B = new ColumnOfOneTable
            {
                columnName = "B",
                isPkey = true,
                dispNo = 1
            };
            List<ColumnOfOneTable> columnPlotB = new List<ColumnOfOneTable>(capacity);
            for (int i = 0; i < capacity; i++) columnPlotB.Add(new ColumnOfOneTable());
            columnPlotB[0] = columnOfOneTable01_B;
            od.Add("B", columnPlotB);

            ColumnOfOneTable columnOfOneTable01_C = new ColumnOfOneTable
            {
                columnName = "C",
                isPkey = false,
                dispNo = 2
            };
            List<ColumnOfOneTable> columnPlotC = new List<ColumnOfOneTable>(capacity);
            for (int i = 0; i < capacity; i++) columnPlotC.Add(new ColumnOfOneTable());
            columnPlotC[0] = columnOfOneTable01_C;
            od.Add("C", columnPlotC);

            ColumnOfOneTable columnOfOneTable01_E = new ColumnOfOneTable
            {
                columnName = "E",
                isPkey = false,
                dispNo = 3
            };
            List<ColumnOfOneTable> columnPlotE = new List<ColumnOfOneTable>(capacity);
            for (int i = 0; i < capacity; i++) columnPlotE.Add(new ColumnOfOneTable());
            columnPlotE[0] = columnOfOneTable01_E;
            od.Add("E", columnPlotE);


            ColumnOfOneTable columnOfOneTable02_A = new ColumnOfOneTable
            {
                columnName = "A",
                isPkey = true,
                dispNo = 1
            };
            List<ColumnOfOneTable> columnPlotA = new List<ColumnOfOneTable>(capacity);
            for (int i = 0; i < capacity; i++) columnPlotA.Add(new ColumnOfOneTable());
            columnPlotA[1] = columnOfOneTable02_A;

            //TODO:ここでAddする時点でAをBの前にinsertする必要がある。
            //od.Add("A", columnPlotA);
            if(od.Contains("A")==false) {
                //columnOfOneTable02_A.dispNo とおなじdispNoをodがもっている
                //List<ColumnOfOneTable>の第一要素から取得。
                Console.WriteLine("AとおなじdispNoをもつカラム探すロジック start");
                Console.WriteLine(getColumnName(od, 0, 1));
                Console.WriteLine("AとおなじdispNoをもつカラム探すロジック end");
                //取得したオブジェクトのcolumnNameが文字としてcolumnOfOneTable02_A.columnName
                //の大小比較。
                String tempColumnName = getColumnName(od, 0, 1);


                if (String.Compare("A", tempColumnName, true) < 0)
                {
                    //小さければ、od[取得したオブジェクトのcolumnName]のまえにinsert。
                    Console.WriteLine("並べ替え順序において A は " + tempColumnName + " の前になります。");
                }
                else {
                    //大きければ、od[取得したオブジェクトのcolumnName]の後ろにinsert。
                    Console.WriteLine("並べ替え順序において A は " + tempColumnName + " のと同じか後ろになります。");
                }
            }

            ColumnOfOneTable columnOfOneTable02_B = new ColumnOfOneTable
            {
                columnName = "B",
                isPkey = true,
                dispNo = 2
            };

            List<ColumnOfOneTable> tmpColumnPlotB = (List<ColumnOfOneTable>)od["B"];
            tmpColumnPlotB[1] = columnOfOneTable02_B;

            ColumnOfOneTable columnOfOneTable02_F = new ColumnOfOneTable
            {
                columnName = "F",
                isPkey = false,
                dispNo = 3
            };
            List<ColumnOfOneTable> columnPlotF = new List<ColumnOfOneTable>(capacity);
            for (int i = 0; i < capacity; i++) columnPlotF.Add(new ColumnOfOneTable());
            columnPlotF[1] = columnOfOneTable02_F;
            od.Add("F", columnPlotF);

        }

        String getColumnName(OrderedDictionary od, int index, int searchDispNo) {

            foreach (DictionaryEntry de in od)
            {
                List<ColumnOfOneTable> tmp = (List<ColumnOfOneTable>)de.Value;
                if (tmp[index].dispNo == searchDispNo) {
                    return tmp[index].columnName;
                }
            }
            return "";
        }

        int getPosition(String key, OrderedDictionary od) {
            Dictionary<String, int> d = new Dictionary<String, int>();
            int i = 0;
            foreach (DictionaryEntry de in od)
            {
                d.Add(de.Key.ToString(), i);
                i++;
            }

            return d[key];
        }

    }

    public class ColumnOfOneTable{
        public string columnName { get; set; }
        public bool isPkey { get; set; }
        public int dispNo { get; set; }
    }
}
