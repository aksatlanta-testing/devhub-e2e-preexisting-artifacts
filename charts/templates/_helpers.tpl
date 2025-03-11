
{{- define "go-echob24f0b58-7fcc-4830-a89d-1c89df0af1dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob24f0b58-7fcc-4830-a89d-1c89df0af1dd.fullname" -}}
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


{{- define "go-echob24f0b58-7fcc-4830-a89d-1c89df0af1dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob24f0b58-7fcc-4830-a89d-1c89df0af1dd.labels" -}}
helm.sh/chart: {{ include "go-echob24f0b58-7fcc-4830-a89d-1c89df0af1dd.chart" . }}
{{ include "go-echob24f0b58-7fcc-4830-a89d-1c89df0af1dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob24f0b58-7fcc-4830-a89d-1c89df0af1dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob24f0b58-7fcc-4830-a89d-1c89df0af1dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}