using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using drawing=System.Drawing;
using System.Drawing.Imaging;
using System.IO;

namespace CS.WebControls
{
    /// <summary>
    /// 
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:WebCropImage runat=server ScriptPath=~/scripts/ IncludeJQuery=true></{0}:WebCropImage>")]
    public class WebCropImage : WebControl,INamingContainer
    {
        /// <summary>
        /// 
        /// </summary>
        public delegate void CropImageEventHandler(Object sender, CropImageEventArgs e);
        
        
        /// <summary>
        /// 
        /// </summary>
        public event CropImageEventHandler Cropped;


        /// <summary>
        /// 
        /// </summary>
        public event CropImageEventHandler Cropping;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public virtual void OnCropped(Object sender, CropImageEventArgs e)
        {
            if (Cropped != null)
            {
                Cropped(this, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public virtual void OnCropping(Object sender, CropImageEventArgs e)
        {
            if (Cropping != null)
            {
                Cropping(this, e);
            }
        }


        private string APath { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="path"></param>
        public void Crop(string path) {

            CropImageEventArgs args = new CropImageEventArgs();
            args.x = Convert.ToInt32(Page.Request["_x_" + this.ClientID]);
            args.y = Convert.ToInt32(Page.Request["_y_" + this.ClientID]);
            args.width = Convert.ToInt32(Page.Request["_w_" + this.ClientID]);
            args.height = Convert.ToInt32(Page.Request["_h_" + this.ClientID]);

            OnCropping(this, args);            

            // create property called saveas and save this file to there.
            System.Drawing.Graphics g = null;
            System.Drawing.Bitmap cropedImage = null;
            
            drawing.Image image = drawing.Image.FromFile(HttpContext.Current.Server.MapPath(this.ImagePath));

            cropedImage = new System.Drawing.Bitmap(args.width, args.height, image.PixelFormat);
            g = System.Drawing.Graphics.FromImage(cropedImage);

            drawing.Rectangle _rec = new drawing.Rectangle(0, 0,
                                args.width,
                                args.height);

            drawing.Rectangle _rec2 = new drawing.Rectangle(
                            args.x,
                            args.y,
                            args.width,
                            args.height);

            g.DrawImage(image, _rec, _rec2.X, _rec2.Y, _rec2.Width, _rec2.Height, drawing.GraphicsUnit.Pixel);
            image.Dispose();

            cropedImage.Save(HttpContext.Current.Server.MapPath(path));
            g.Dispose();

            cropedImage.Dispose();

            OnCropped(this, args);
        }


        private string cropimage;
        /// <summary>
        /// ID of the asp.net Image control to be cropped.
        /// </summary>
        [Bindable(true)]
        [DefaultValue("")]
        [Category("CS")
            ,Description("ID of the asp.net Image control to be cropped.")]            
        public string CropImage {
            get 
            {  
                return cropimage; }
            set {                
                cropimage = value; }
        }


        private string maxSize;
        /// <summary>
        /// MaxSize of the asp.net Image control to be cropped.
        /// </summary>
        [Bindable(true)]
        [DefaultValue("")]
        [Category("CS")
            , Description("[w,h]")]
        public string MaxSize
        {
            get
            {
                return maxSize;
            }
            set
            {
                maxSize = value;
            }
        }

        private string minSize;
        /// <summary>
        /// MinSize of the asp.net Image control to be cropped.
        /// </summary>
        [Bindable(true)]
        [DefaultValue("")]
        [Category("CS")
            , Description("[w,h]")]
        public string MinSize
        {
            get
            {
                return minSize;
            }
            set
            {
                minSize = value;
            }
        }
        
        
        
        
        /// <summary>
        /// 
        /// </summary>
        private string ImagePath { get { return ViewState["imagePath"].ToString(); } }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            EnsureChildControls();
            BuildScripts();
            AttachToClientScriptArea();

        }
        

        /// <summary>
        /// Renders the control to the specified HTML writer.
        /// </summary>
        /// <param name="writer">The <see cref="T:System.Web.UI.HtmlTextWriter"/> object that receives the control content.</param>
        /*protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
         
            
        }*/
        

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            EnsureChildControls();

            //BuildScripts();
            //AttachToClientScriptArea();
            
        }



        /// <summary>
        /// Script that will be registered.
        /// </summary>
        private string script;

        /// <summary>
        /// Attaches to client script area.
        /// </summary>
        private void AttachToClientScriptArea() {
            ClientScriptManager cs = Page.ClientScript;
            cs.RegisterClientScriptBlock(this.GetType()
                            , "cropInit" + this.ClientID
                            , this.script);
             
            
        }

        /// <summary>
        /// Builds the scripts.
        /// </summary>
        private void BuildScripts() {

            try
            {
                IButtonControl btn = (IButtonControl)this.Parent.FindControl(this.CropButtonID);
                btn.Click += new EventHandler(btn_Click);
            }
            catch
            {
                throw new NullReferenceException("Please set CropButtonID property, it can be either linkbutton or button control. [" + this.ID.ToString() + "]");
            }

            string aPath = HttpContext.Current.Request.Url.AbsolutePath.Replace(
                HttpContext.Current.Request.Url.Segments[HttpContext.Current.Request.Url.Segments.Length - 1], "");

            this.APath = aPath;

            ClientScriptManager cs = Page.ClientScript;

            if (this.IncludeJQuery)
            {
                if (string.IsNullOrEmpty(this.ScriptPath))
                {
                    this.ScriptPath = APath + "scripts/";
                }
                if (!cs.IsClientScriptIncludeRegistered(this.GetType(), "jquery"))
                    cs.RegisterClientScriptInclude(this.GetType()
                        , "jquery", ResolveClientUrl(this.ScriptPath + "jquery.js"));

                if (!cs.IsClientScriptIncludeRegistered(this.GetType(), "jqueryCrop"))
                    cs.RegisterClientScriptInclude(this.GetType()
                        , "jqueryCrop", ResolveClientUrl(this.ScriptPath + "jquery.jcrop.js"));


            }

            //bool cropInitScriptAdded = cs.IsClientScriptBlockRegistered("cropInit");            
            cs.RegisterHiddenField("_x_" + this.ClientID, this.x.ToString());
            cs.RegisterHiddenField("_y_" + this.ClientID, this.y.ToString());
            cs.RegisterHiddenField("_w_" + this.ClientID, this.w.ToString());
            cs.RegisterHiddenField("_h_" + this.ClientID, this.h.ToString());

            if (true)
            {

                Image image = (Image)this.Parent.FindControl(cropimage);
                ViewState["imagePath"] = image.ImageUrl;

                StringBuilder sb = new StringBuilder();
                sb.Append("<script>");
                sb.Append("$(function(){");


                int x = X; int y = Y; int w = W == 0 ? 15 : W; int h = H == 0 ? 15 : H;

                sb.Append("$('#" + image.ClientID + "').Jcrop({" +
                    "setSelect: [" + x.ToString() + "," + y.ToString() + "," + w.ToString() + ", " + h.ToString() + "]" +
                    ", onChange: __showPreview_" + this.ClientID);


                if (!string.IsNullOrEmpty(this.Ratio))
                    sb.Append(", aspectRatio: " + this.Ratio);

                if (!string.IsNullOrEmpty(this.MaxSize))
                    sb.Append(", maxSize: [" + this.MaxSize + "]");

                if (!string.IsNullOrEmpty(this.MinSize))
                    sb.Append(", minSize: [" + this.MinSize + "]");




                sb.Append("});");

                sb.Append("});");

                sb.Append("function __showPreview_" + this.ClientID + " (coords){" +
                                    "$('#_x_" + this.ClientID + "').val(coords.x);" +
                                    "$('#_y_" + this.ClientID + "').val(coords.y);" +
                                    "$('#_w_" + this.ClientID + "').val(coords.w);" +
                                    "$('#_h_" + this.ClientID + "').val(coords.h);" +
                                    "}");

                sb.Append("</script>");
                this.script = sb.ToString();
                                
            }
        }

        /// <summary>
        /// Button clicked to crop.
        /// </summary>
        /// <param name="sender">IButtonControl</param>
        /// <param name="e">Eventargs</param>
        void btn_Click(object sender, EventArgs e)
        {
            //HttpContext.Current.Response.Write("btn clicked.");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="output"></param>
        protected override void RenderContents(HtmlTextWriter output)
        {
            base.RenderContents(output);
            if (DesignMode)
                output.Write("Design view: " + this.ID);
        }


        
        
        /* 
         * must for all composite controls!           
         * http://msdn.microsoft.com/en-us/library/aa478969.aspx
        */
        /// <summary>
        /// 
        /// </summary>
        public override ControlCollection Controls
        {
            get
            {
                EnsureChildControls();
                return base.Controls;
            }
        }



        #region "Properties"

        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [DefaultValue("")]
        [Category("CS")]
        public string CropButtonID { get; set; }

        private int x;
        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [DefaultValue(0)]
        [Category("CS")]
        public int X { get { EnsureChildControls(); return x; } set { EnsureChildControls(); x = value; } }

        private int y;
        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [DefaultValue(0)]
        [Category("CS")]
        public int Y { get { EnsureChildControls(); return y; } set { EnsureChildControls(); y = value; } }

        private int w;
        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]        
        [Category("CS")]
        public int W { get { EnsureChildControls(); return w; } set { EnsureChildControls(); w = value; } }

        private int h;
        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]        
        [Category("CS")]
        public int H { get { EnsureChildControls(); return h; } set { EnsureChildControls(); h = value; } }


        private string scriptPath;
        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [DefaultValue("~/scripts/")]
        [Category("CS")]
        public string ScriptPath { get { EnsureChildControls(); return scriptPath; } set { EnsureChildControls(); scriptPath = value; } }


        private bool includeJQuery;
        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [DefaultValue("")]
        [Category("CS")]
        public bool IncludeJQuery { get { EnsureChildControls(); return includeJQuery; } set { EnsureChildControls(); includeJQuery = value; } }

        /// <summary>
        /// If you set ratio no need to set both W and H properties.
        /// </summary>
        [Bindable(true)]
        [DefaultValue("")]
        [Category("CS")]
        public string Ratio { get; set; }


        #endregion

    }
}
