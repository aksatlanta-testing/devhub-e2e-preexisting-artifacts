
{{- define "go-echoae03494d-51aa-4718-8f4e-092675ac1534.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae03494d-51aa-4718-8f4e-092675ac1534.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoae03494d-51aa-4718-8f4e-092675ac1534.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae03494d-51aa-4718-8f4e-092675ac1534.labels" -}}
helm.sh/chart: {{ include "go-echoae03494d-51aa-4718-8f4e-092675ac1534.chart" . }}
{{ include "go-echoae03494d-51aa-4718-8f4e-092675ac1534.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae03494d-51aa-4718-8f4e-092675ac1534.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae03494d-51aa-4718-8f4e-092675ac1534.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}