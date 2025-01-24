
{{- define "go-echof143c75b-72a9-4e72-9ec0-a372aacb5947.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof143c75b-72a9-4e72-9ec0-a372aacb5947.fullname" -}}
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


{{- define "go-echof143c75b-72a9-4e72-9ec0-a372aacb5947.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof143c75b-72a9-4e72-9ec0-a372aacb5947.labels" -}}
helm.sh/chart: {{ include "go-echof143c75b-72a9-4e72-9ec0-a372aacb5947.chart" . }}
{{ include "go-echof143c75b-72a9-4e72-9ec0-a372aacb5947.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof143c75b-72a9-4e72-9ec0-a372aacb5947.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof143c75b-72a9-4e72-9ec0-a372aacb5947.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}