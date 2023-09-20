package golden

import (
    "flag"
    "fmt"
    "os"
    "path/filepath"
    "regexp"
    "strings"
    "testing"

    "github.com/gruntwork-io/terratest/modules/helm"
)

var update = flag.Bool("update", false, "update golden test output files")

func TestHelmRender(t *testing.T) {
    files, err := os.ReadDir("./test/golden")
    if err != nil {
        t.Fatal(err)
    }

    for _, f := range files {
        if !f.IsDir() && strings.HasSuffix(f.Name(), ".yaml") && !strings.HasSuffix(f.Name(), ".golden.yaml") {
            // Render this values.yaml file
            output := helm.RenderTemplate(t,
                &helm.Options{
                    ValuesFiles: []string{"test/golden/" + f.Name()},
                    SetValues: map[string]string{
                        "versionOverrideForTests": "0.0.0-test",
                    },
                },
                "./stable/connector",
                "test",
                nil,
            )

            goldenFile := "test/golden/" + strings.TrimSuffix(f.Name(), filepath.Ext(".yaml")) + ".golden.yaml"
            regex := regexp.MustCompile(`\s+helm.sh/chart:\s+.*`)
            bytes := regex.ReplaceAll([]byte(output), []byte(""))

            output = fmt.Sprintf("%s\n", string(bytes))

            if *update {
                err := os.WriteFile(goldenFile, []byte(output), 0644)
                if err != nil {
                    t.Fatal(err)
                }
            }

            expected, err := os.ReadFile(goldenFile)
            if err != nil {
                t.Fatal(err)
            }

            if string(expected) != output {
                t.Fatalf("Expected %s, but got %s\n. Update golden files by running `go test -v ./... -update`", string(expected), output)
            }
        }

    }
}
