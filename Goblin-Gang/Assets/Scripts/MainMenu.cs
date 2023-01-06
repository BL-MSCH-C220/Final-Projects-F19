using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenu : MonoBehaviour

{
    public GameObject Image;
    // Start is called before the first frame update
    public void StartGame()
    {
        StartCoroutine("SceneChange");
        SceneManager.LoadScene("Game");
    }
    public void EndGame()
    {
        StartCoroutine("SceneChange");
        Application.Quit();
    }
    IEnumerator SceneChange()
    {
        Image.GetComponent<Animator>().Play("Fade Out");
        yield return new WaitForSeconds(3.0f);
    }
}
