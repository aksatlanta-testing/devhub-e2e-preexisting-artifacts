
{{- define "go-echoc51b9623-04bc-455c-9e0e-d0cf4892db83.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc51b9623-04bc-455c-9e0e-d0cf4892db83.fullname" -}}
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


{{- define "go-echoc51b9623-04bc-455c-9e0e-d0cf4892db83.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc51b9623-04bc-455c-9e0e-d0cf4892db83.labels" -}}
helm.sh/chart: {{ include "go-echoc51b9623-04bc-455c-9e0e-d0cf4892db83.chart" . }}
{{ include "go-echoc51b9623-04bc-455c-9e0e-d0cf4892db83.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc51b9623-04bc-455c-9e0e-d0cf4892db83.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc51b9623-04bc-455c-9e0e-d0cf4892db83.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}