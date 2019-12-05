using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ProgressQuest_Client
{
    /// <summary>
    /// This class is used to hide a character ID in a Combobox control and retrieve it when needed. Those items are added to a combobox.
    /// </summary>
    public class ComboBoxItem
    {
        string displayValue; ///<summary>Value to display when asking for a combobox item.</summary>
        int hiddenCharID; ///<summary>Hidden value, not for display. Used to identify characters.</summary>

        /// <summary>
        /// Constructor for a ComboBoxItem. Create an item with a display value and a hidden value. Used to load a combobox with hidden ID's.
        /// </summary>
        /// <param name="display">Value to display when asking for a combobox item.</param>
        /// <param name="hidden">Hidden value. Usually a unique character ID.</param>
        public ComboBoxItem(string display, int hidden)
        {
            displayValue = display;
            hiddenCharID = hidden;
        }

        /// <summary>
        /// Get the ID for the selected character.
        /// </summary>
        /// <returns></returns>
        public int getID()
        {
            return hiddenCharID;
        }

        /// <summary>
        /// Override to give the display value (Usually name + level of selected character).
        /// </summary>
        /// <returns>String value of character info (Name + level properly formatted.)</returns>
        public override string ToString()
        {
            return displayValue;
        }
    }
}
