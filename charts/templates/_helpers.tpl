
{{- define "go-echo09d7a512-1898-47e3-a79f-dade9f696a21.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo09d7a512-1898-47e3-a79f-dade9f696a21.fullname" -}}
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


{{- define "go-echo09d7a512-1898-47e3-a79f-dade9f696a21.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo09d7a512-1898-47e3-a79f-dade9f696a21.labels" -}}
helm.sh/chart: {{ include "go-echo09d7a512-1898-47e3-a79f-dade9f696a21.chart" . }}
{{ include "go-echo09d7a512-1898-47e3-a79f-dade9f696a21.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo09d7a512-1898-47e3-a79f-dade9f696a21.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo09d7a512-1898-47e3-a79f-dade9f696a21.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}