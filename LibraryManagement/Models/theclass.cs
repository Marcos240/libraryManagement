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
    
    public partial class theclass
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public theclass()
        {
            this.pupils = new HashSet<pupil>();
            this.transgress_class = new HashSet<transgress_class>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public int teacher_id { get; set; }
        public int grade_id { get; set; }
        public string chief_parent { get; set; }
        public double point { get; set; }
        public string note { get; set; }
        public double pointSDB { get; set; }
    
        public virtual grade grade { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<pupil> pupils { get; set; }
        public virtual teacher teacher { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<transgress_class> transgress_class { get; set; }
    }
}
