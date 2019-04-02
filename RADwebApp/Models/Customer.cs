/* Emma's Kyosk - Mac & Donald Corporation
 * Customers' Model
 * Done by: Fabio Ribas
 * Last modified: 2018-12-08
 * */

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace RADwebApp
{
    public class Customer
    {
        [Required(ErrorMessage = "You cannot leave the first name blank.")]
        [StringLength(50, ErrorMessage = "First name cannot be more than 50 characters long.")]
        public string custFirst { get; set; }

        [Required(ErrorMessage = "You cannot leave the first name blank.")]
        [StringLength(100, ErrorMessage = "Last name cannot be more than 100 characters long.")]
        public string custLast { get; set; }

        [Required(ErrorMessage = "Phone number is required.")]
        [RegularExpression("^\\d{10}$", ErrorMessage = "Please enter a valid 10-digit phone number (no spaces).")]
        [DataType(DataType.PhoneNumber)]
        [DisplayFormat(DataFormatString = "{0:(###) ###-####}", ApplyFormatInEditMode = false)]
        public string custPhone { get; set; }

        [Required(ErrorMessage = "Address is required.")]
        public string custAddress { get; set; }

        [Required(ErrorMessage = "You cannot leave the city blank.")]
        public string custCity { get; set; }

        [Required(ErrorMessage = "Please enter the postal code.")]
        [RegularExpression("^[ABCEGHJ-NPRSTVXY]{1}[0-9]{1}[ABCEGHJ-NPRSTV-Z]{1}[ ]?[0-9]{1}[ABCEGHJ-NPRSTV-Z]{1}[0-9]{1}$", ErrorMessage = "Please enter a valid Canadian postal code.")]
        public string custPostal { get; set; }

        [Required(ErrorMessage = "You cannot leave the e-mail blank.")]
        [StringLength(255, ErrorMessage = "E-mail address cannot be more than 255 characters long.")]
        [EmailAddress(ErrorMessage = "Please enter a valid e-mail format.")]
        public string custEmail { get; set; }
    }
}