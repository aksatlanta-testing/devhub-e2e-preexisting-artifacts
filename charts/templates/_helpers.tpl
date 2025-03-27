
{{- define "go-echoe15eadd7-be0d-49d8-a35c-68ac563d1125.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe15eadd7-be0d-49d8-a35c-68ac563d1125.fullname" -}}
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


{{- define "go-echoe15eadd7-be0d-49d8-a35c-68ac563d1125.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe15eadd7-be0d-49d8-a35c-68ac563d1125.labels" -}}
helm.sh/chart: {{ include "go-echoe15eadd7-be0d-49d8-a35c-68ac563d1125.chart" . }}
{{ include "go-echoe15eadd7-be0d-49d8-a35c-68ac563d1125.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe15eadd7-be0d-49d8-a35c-68ac563d1125.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe15eadd7-be0d-49d8-a35c-68ac563d1125.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}