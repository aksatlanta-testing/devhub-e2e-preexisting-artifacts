
{{- define "go-echo9dc17f70-6e4d-4920-a492-f3511365c3ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9dc17f70-6e4d-4920-a492-f3511365c3ab.fullname" -}}
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


{{- define "go-echo9dc17f70-6e4d-4920-a492-f3511365c3ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9dc17f70-6e4d-4920-a492-f3511365c3ab.labels" -}}
helm.sh/chart: {{ include "go-echo9dc17f70-6e4d-4920-a492-f3511365c3ab.chart" . }}
{{ include "go-echo9dc17f70-6e4d-4920-a492-f3511365c3ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9dc17f70-6e4d-4920-a492-f3511365c3ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9dc17f70-6e4d-4920-a492-f3511365c3ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}