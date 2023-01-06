using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Intro : MonoBehaviour
{
    public GameObject Image;
    // Start is called before the first frame update
    void Awake()
    {
        StartCoroutine("SceneChange");
    }
    IEnumerator SceneChange()
    {
        Image.GetComponent<Animator>().Play("FadeIn");
        yield return new WaitForSeconds(3.0f);
        Image.GetComponent<Animator>().SetTrigger("MainMenu");
        SceneManager.LoadScene("MainMenu");
    }
}
