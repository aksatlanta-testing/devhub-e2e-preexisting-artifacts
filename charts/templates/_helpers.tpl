
{{- define "go-echo08ac2ee8-163c-4954-8931-3dadad93a14f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08ac2ee8-163c-4954-8931-3dadad93a14f.fullname" -}}
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


{{- define "go-echo08ac2ee8-163c-4954-8931-3dadad93a14f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08ac2ee8-163c-4954-8931-3dadad93a14f.labels" -}}
helm.sh/chart: {{ include "go-echo08ac2ee8-163c-4954-8931-3dadad93a14f.chart" . }}
{{ include "go-echo08ac2ee8-163c-4954-8931-3dadad93a14f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08ac2ee8-163c-4954-8931-3dadad93a14f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08ac2ee8-163c-4954-8931-3dadad93a14f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}