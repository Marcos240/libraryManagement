//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LibraryManagement.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class transgress_pupil
    {
        public int id { get; set; }
        public int pupil_id { get; set; }
        public int rule_id { get; set; }
        public System.DateTime transgressed_at { get; set; }
    
        public virtual pupil pupil { get; set; }
        public virtual rule rule { get; set; }
    }
}