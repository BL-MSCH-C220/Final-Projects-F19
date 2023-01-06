using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ExitWin : MonoBehaviour
{
     void Update()
    {
        if(Input.GetButtonDown("Cancel"))
        {
            Application.Quit();
        }
    }
}
