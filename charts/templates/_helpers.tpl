
{{- define "go-echoda8a50b9-1b51-429d-a45b-3970a2ec4e2f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda8a50b9-1b51-429d-a45b-3970a2ec4e2f.fullname" -}}
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


{{- define "go-echoda8a50b9-1b51-429d-a45b-3970a2ec4e2f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda8a50b9-1b51-429d-a45b-3970a2ec4e2f.labels" -}}
helm.sh/chart: {{ include "go-echoda8a50b9-1b51-429d-a45b-3970a2ec4e2f.chart" . }}
{{ include "go-echoda8a50b9-1b51-429d-a45b-3970a2ec4e2f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda8a50b9-1b51-429d-a45b-3970a2ec4e2f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda8a50b9-1b51-429d-a45b-3970a2ec4e2f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}