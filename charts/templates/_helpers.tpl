
{{- define "go-echoba5a19bd-4986-4fe4-a2d2-4be077b2bc9a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba5a19bd-4986-4fe4-a2d2-4be077b2bc9a.fullname" -}}
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


{{- define "go-echoba5a19bd-4986-4fe4-a2d2-4be077b2bc9a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba5a19bd-4986-4fe4-a2d2-4be077b2bc9a.labels" -}}
helm.sh/chart: {{ include "go-echoba5a19bd-4986-4fe4-a2d2-4be077b2bc9a.chart" . }}
{{ include "go-echoba5a19bd-4986-4fe4-a2d2-4be077b2bc9a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba5a19bd-4986-4fe4-a2d2-4be077b2bc9a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba5a19bd-4986-4fe4-a2d2-4be077b2bc9a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}