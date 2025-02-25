
{{- define "go-echoee924fdc-8655-4e88-b73f-e65d16a9b8ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee924fdc-8655-4e88-b73f-e65d16a9b8ce.fullname" -}}
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


{{- define "go-echoee924fdc-8655-4e88-b73f-e65d16a9b8ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee924fdc-8655-4e88-b73f-e65d16a9b8ce.labels" -}}
helm.sh/chart: {{ include "go-echoee924fdc-8655-4e88-b73f-e65d16a9b8ce.chart" . }}
{{ include "go-echoee924fdc-8655-4e88-b73f-e65d16a9b8ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee924fdc-8655-4e88-b73f-e65d16a9b8ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee924fdc-8655-4e88-b73f-e65d16a9b8ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}