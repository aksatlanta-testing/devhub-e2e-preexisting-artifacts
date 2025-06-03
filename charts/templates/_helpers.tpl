
{{- define "go-echobdeaab21-53f1-47b3-872e-2c534a9f1552.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdeaab21-53f1-47b3-872e-2c534a9f1552.fullname" -}}
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


{{- define "go-echobdeaab21-53f1-47b3-872e-2c534a9f1552.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdeaab21-53f1-47b3-872e-2c534a9f1552.labels" -}}
helm.sh/chart: {{ include "go-echobdeaab21-53f1-47b3-872e-2c534a9f1552.chart" . }}
{{ include "go-echobdeaab21-53f1-47b3-872e-2c534a9f1552.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdeaab21-53f1-47b3-872e-2c534a9f1552.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdeaab21-53f1-47b3-872e-2c534a9f1552.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}