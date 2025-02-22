
{{- define "go-echoa1c1bf4e-60e2-4da8-ab31-cf8450d282fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1c1bf4e-60e2-4da8-ab31-cf8450d282fd.fullname" -}}
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


{{- define "go-echoa1c1bf4e-60e2-4da8-ab31-cf8450d282fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1c1bf4e-60e2-4da8-ab31-cf8450d282fd.labels" -}}
helm.sh/chart: {{ include "go-echoa1c1bf4e-60e2-4da8-ab31-cf8450d282fd.chart" . }}
{{ include "go-echoa1c1bf4e-60e2-4da8-ab31-cf8450d282fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1c1bf4e-60e2-4da8-ab31-cf8450d282fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1c1bf4e-60e2-4da8-ab31-cf8450d282fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}