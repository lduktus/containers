Wolfi based LanguageTool image, includes:

- [fasttext](https://fasttext.cc/)
- [lid.176.bin](https://fasttext.cc/docs/en/language-identification.html)

The image downloads the latest stable LanguageTool release and builds the latest commit to fasttext.[^1]
All files are placed in /opt/LanguageTool and the image defaults to the nonroot user.

# File Structure

- /opt/LanguageTool/fastText/fastext: path to the fasttext binary
- /opt/LanguageTool/fastText-data: directory for fasttext models
- /opt/LanguageTool/fastText/ngram-data: directory for ngram models[^2]
- /opt/LanguageTool/languagetool-server.jar: the actual binary

The image also ships a [startup script](./lt-server.sh) and a default [configuration file](./server.config).
The script is placed in `/usr/local/bin`. There is also an example [Quadlet](./quadlet/languagetool.container) for Systemd integration.

# Environment Variables

- `LT_PORT`: defaults to 8081
- `LT_CONFIG`: defaults to /opt/LanguageTool/server.config

Additional ngram-data and fasttext models can be downloaded on their project websites:

- <https://languagetool.org/download/ngram-data/>
- <https://fasttext.cc/docs/en/english-vectors.html>

# Credit

- **Borrowed Code:** <https://github.com/Accio/2020-05-InstallAndRunLanguageTools>

# References

- [LanguageTool Documentation](https://dev.languagetool.org/)

[^1]: Fastext has been deprecated, see: [Issue 10522](https://github.com/languagetool-org/languagetool/issues/10522)
[^2]: The image does not ship with any ngram models.