import com.sun.speech.freetts.Voice;
import com.sun.speech.freetts.VoiceManager;

// Testing Makefile here
// acv

public class Speaker {

    private static final String VOICE_NAME = "kevin16";

    public void speak(String text) {

        VoiceManager voiceManager =
                VoiceManager.getInstance();

        Voice voice =
                voiceManager.getVoice(VOICE_NAME);

        if (voice == null) {
            System.out.println(
                "Voice not found: " + VOICE_NAME);
            return;
        }

        voice.allocate();

        try {
            voice.speak(text);
        }
        finally {
            voice.deallocate();
        }
    }
}
