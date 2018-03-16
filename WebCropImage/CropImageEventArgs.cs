using System;
using System.Collections.Generic;
using System.Text;

namespace CS.WebControls
{
    public class CropImageEventArgs : EventArgs
    {

        public int x { get; set; }
        public int y { get; set; }
        public int width { get; set; }
        public int height { get; set; }

        public CropImageEventArgs() { 
             
        }

    }
}
